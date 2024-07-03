module HttpBasicAuth
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_admin
  end

  private

  def authenticate_admin
    username = ENV['HTTP_BASIC_AUTH_USERNAME']
    password = ENV['HTTP_BASIC_AUTH_PASSWORD']

    authenticate_or_request_with_http_basic do |provided_username, provided_password|
      provided_username == username && provided_password == password
    end
  end
end