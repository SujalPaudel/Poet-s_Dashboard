module ApplicationHelper
  def login_helper style = '' #by default style is going to be set, but they are only empty strings.
    if current_user.is_a?(GuestUser) 
    (link_to "Register", new_user_registration_path, class: style )+ " ".html_safe + (link_to "Login", new_user_session_path, class: style )
    else 
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
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


#we use content_tag to access the html code inside of the ruby methods.
#it makes your code cleaner in an overall manner

#nav_items represents array of hash-values

  def nav_items
  [
    {
      url: root_path,
      title: 'Home'
    },
    {
      url: about_me_path,
      title: 'About Me'
    },
    {
      url: contact_me_path,
      title: 'Contact'
    },
    {
      url: blogs_path,
      title: 'Blogs'
    },
    {
      url: portfolios_path,
      title: 'Portfolios'
    },
    {
      url: tech_news_path,
      title: 'Selected Tweets'
    },
  ]
  end

  def nav_helper style, tag_type
    nav_links = ''
    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href = '#{item[:url]}' class = '#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end

    nav_links.html_safe
    
  end


  #take path as argument, and active? is a boolean method, returns either true or false
  def active? path 
    "active" if current_page? path
  end
  #return active if the current page(rails method) matches whatever path we pass in

  def alerts 
    alert = (flash[:alert] || flash[:error] || flash[:notice]) #mini conditionals

    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: "Samip Dhungel Portfolio", sticky: false) 
  end
end


#{tag_type} represents the string interpolation
#String interpolation is how you can display the value of a variable within a string

