class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:employer_or_school, :linkedin_url, :sublessor_status, :sublessee_status, :bio, :first_name, :last_name])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:employer_or_school, :linkedin_url, :sublessor_status, :sublessee_status, :bio, :first_name, :last_name])
  end
end
