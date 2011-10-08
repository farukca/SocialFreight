RSpec.configure do |config|
  config.include Mongoid::Matchers
end

#Spec::Runner.configure do |config|
#  config.include Rack::Test::Methods
#  config.before :all do
#    Mongoid.database.collections.each(&:drop)
#  end
#end
