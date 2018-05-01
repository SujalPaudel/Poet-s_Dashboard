class ApplicationController < ActionController::Base
 
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern 
end

  #set the session, in the source, and set the session[:source] as params[:q]
  #current_user is a method from the devise gem


