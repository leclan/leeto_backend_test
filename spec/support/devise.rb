RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::IntegrationHelpers, type: :feature
  config.include Devise::Test::ControllerHelpers, devise_helpers: :controller
  config.include Devise::Test::IntegrationHelpers, devise_helpers: :integration
end