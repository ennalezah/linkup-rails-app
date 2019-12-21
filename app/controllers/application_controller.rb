class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include DefaultPageContent

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || user_path(resource)
  end
end
