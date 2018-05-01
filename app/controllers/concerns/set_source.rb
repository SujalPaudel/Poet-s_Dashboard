module SetSource
  extend ActiveSupport::Concern #its a module in itself, which allows us with cool features like included

  included do 
    before_action :set_source
  end

  def set_source
    session[:source] = params[:q] if params[:q]
  end
end