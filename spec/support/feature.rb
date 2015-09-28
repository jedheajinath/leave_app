RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include Devise::TestHelpers, type: :view
end

# RSpec.configure do |config|
#   config.include Features::SessionHelpers, type: :feature
# end
