# app/channels/application_cable/connection.rb

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = current_user
    end

    private

    def current_user
      token = request.params[:token].to_s

      email = (token.present? && token != 'null') ? Base64.decode64(token) : nil
      verified_user = User.find_by(email: email)

      verified_user || reject_unauthorized_connection
    end
  end
end
