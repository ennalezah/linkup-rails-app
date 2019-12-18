module DeviseWhitelist
  # allows access to methods inside ActiveSupport module
  extend ActiveSupport::Concern

  included do 
    # run method only if it's receiving devise controller communication
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  def configure_permitted_parameters
    # allows custom params to be passed in during sign up and account update
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :city, :state])
  end
end 