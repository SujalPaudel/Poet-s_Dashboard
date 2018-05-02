module ApplicationHelper
  def login_helper
    if current_user.is_a?(User) 
      link_to "logout", destroy_user_session_path, method: :delete
    else 
      (link_to "Register", new_user_registration_path) +
      "<br>".html_safe +
      (link_to "login", new_user_session_path)
    end
  end    
end

#the work done by the view helper and the partial is same, but we use helper method, when there is presence of alot of ruby code(ie logical statement) while use the partial methods for sharing of code, when there is alot of html code to be shared.

# alot of ruby code : helper method
# alot of html code : partial method



