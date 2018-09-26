class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  def authenticate
    valid = authenticate_with_http_basic do |username, password|
      admin_username = Rails.application.secrets.admin_username
      admin_password = Rails.application.secrets.admin_password

      username == admin_username && password == admin_password
    end

    head 401 unless valid
  end
end
