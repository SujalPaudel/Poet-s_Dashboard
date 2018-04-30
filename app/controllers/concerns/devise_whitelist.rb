#for the rails parsing engine, the file name and the module name must be kept similar
#devise_whitelist = DeviseWhitelist

module DeviseWhitelist
  extend ActiveSupport::Concern #this allows us to include cool methods inside aptivesupportconcern module, like before filter

  included do 
    before_action :configure_permitted_parameters, if: :devise_controller?
  end
  #I want to run the above method anytime, you encounter with the devise_controller
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
