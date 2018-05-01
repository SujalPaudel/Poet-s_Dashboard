class ApplicationController < ActionController::Base
 
  include DeviseWhitelist
  include SetSource
  
end

  #set the session, in the source, and set the session[:source] as params[:q]



