class ApplicationController < ActionController::Base
 
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern 
  include DefaultPageContent

 
end

  #set the session, in the source, and set the session[:source] as params[:q]
  #current_user is a method from the devise gem

#module NoobiesViewTool
#  class Renderer
    #class metbod, as this method is owned by this class
#    def self.copyright name, msg 
#      "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
#    end
 #   def self.developer weblink
 #    "Designed and Developed By : <a href = '#{weblink}'>Sujal Paudel</a>".html_safe
#    end end end




