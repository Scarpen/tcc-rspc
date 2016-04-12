class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


before_action :configure_permitted_parameters, if: :devise_controller?
protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) << :gender
		devise_parameter_sanitizer.for(:sign_up) << :avatar
		devise_parameter_sanitizer.for(:sign_up) << :phone
		devise_parameter_sanitizer.for(:sign_up) << :date_birthday
		devise_parameter_sanitizer.for(:sign_up) << :address
		devise_parameter_sanitizer.for(:sign_up) << :neighborhood
		devise_parameter_sanitizer.for(:sign_up) << :city
		devise_parameter_sanitizer.for(:sign_up) << :state
		devise_parameter_sanitizer.for(:sign_up) << :zipcode
		devise_parameter_sanitizer.for(:sign_up) << :complement
	end
end