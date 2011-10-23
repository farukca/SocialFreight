RSpec.configure do |config|
  config.include Mongoid::Matchers
  
  config.after(:each) do
    puts "cleaning mongodb...."
    Mongoid.database.collections.each do |collection|
      unless collection.name =~ /^system\./
        collection.remove
      end
    end
    puts "finished cleaning mongodb."
  end

end

#Spec::Runner.configure do |config|
#  config.include Rack::Test::Methods
#  config.before :all do
#    Mongoid.database.collections.each(&:drop)
#  end
#end
