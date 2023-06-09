class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def redirect_with_alert
    redirect_to root_path, alert: "Вам сюда нельзя!"
  end

  private
    def not_found
      render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
    end
end
