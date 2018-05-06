module ApplicationHelper
  def login_helper
    if current_user.is_a?(GuestUser) 
      (link_to "Register", new_user_registration_path) +
      "<br>".html_safe +
      (link_to "login", new_user_session_path)
    else 
      link_to "logout", destroy_user_session_path, method: :delete
    end
  end    


#the work done by the view helper and the partial is same, but we use helper method, when there is presence of alot of ruby code(ie logical statement) while use the partial methods for sharing of code, when there is alot of html code to be shared.

# alot of ruby code : helper method
# alot of html code : partial method


  def source_helper(layout_name)
    if session[:source]
      greeting =  "Thanks for visiting me from, #{session[:source]}, and currently you are in #{layout_name}, layout"
      content_tag(:p, greeting, class: "source_greeting") #we create class for the future use in css
    end
  end
 

  def owner
    NoobiesViewTool::Renderer.copyright 'Samip Dhungel', 'All Rights Reserved'
  end
  def developer
    NoobiesViewTool::Renderer.developer 'https://github.com/SujalPaudel', 'Sujal Paudel'
  end 
end

#we use content_tag to access the html code inside of the ruby methods.
#it makes your code cleaner in an overall manner



