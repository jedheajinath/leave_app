RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def current_user
    user_session_info = response.request.env['rack.session']['warden.user.user.key']
    if user_session_info
      user_id = user_session_info[0][0]
      User.find(user_id)
    else
      nil
    end
  end