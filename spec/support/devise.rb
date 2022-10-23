RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers,
    type: :request
  config.include Devise::Test::ControllerHelpers,
    type: :controller
end