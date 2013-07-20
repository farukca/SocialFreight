set_default :ruby_version, "1.9.3-p125"
#IMPORTANT, if operating system changed, change this bootstrap line
set_default :rbenv_bootstrap, "bootstrap-ubuntu-12-04"

namespace :rbenv do
  desc "Install rbenv, Ruby, and the Bundler gem"
  task :install, roles: :app do
    run "#{sudo} apt-get -y install curl git-core"
    run "curl -L https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash"
    bashrc = <<-BASHRC
if [ -d $HOME/.rbenv ]; then 
  export PATH="$HOME/.rbenv/bin:$PATH" 
  eval "$(rbenv init -)" 
fi
BASHRC
    put bashrc, "/tmp/rbenvrc"
    run "cat /tmp/rbenvrc ~/.bashrc > ~/.bashrc.tmp"
    run "mv ~/.bashrc.tmp ~/.bashrc"
    run %q{export PATH="$HOME/.rbenv/bin:$PATH"}
    run %q{eval "$(rbenv init -)"}
    #run "rbenv #{rbenv_bootstrap}"
    run "rbenv #{rbenv_bootstrap}",:pty => true do |ch, stream, data|
      if data =~ /password for deployer/
        #prompt, and then send the response to the remote process
        ch.send_data(Capistrano::CLI.password_prompt("sudo password for:") + "\n")
      else
        #use the default handler for all other text
        Capistrano::Configuration.default_io_proc.call(ch,stream,data)
      end
    end
    #run %q{sed "s/sudo/sudo -p 'sudo password: '/g" $HOME/.rbenv/plugins/rbenv-installer/bin/rbenv-} + rbenv_bootstrap + " | bash"
    run "rbenv install #{ruby_version}"
    run "rbenv global #{ruby_version}"
    run "gem install bundler --no-ri --no-rdoc"
    run "rbenv rehash"
  end
  after "deploy:install", "rbenv:install"
end