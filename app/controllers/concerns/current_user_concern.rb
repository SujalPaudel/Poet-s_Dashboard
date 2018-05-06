module CurrentUserConcern   
  
  extend ActiveSupport::Concern
  # The Concern is a tool provided by the ActiveSupport lib for including modules in classes

  def current_user
    super || guest_user
  # super = dont change anything, I want the same feature of the method we are overriding
  end

  def guest_user
    guest = GuestUser.new
    guest.name = "Guest User"
    guest.first_name = "Guest"
    guest.last_name = "User"
    guest.email = "guest@example.com"
    guest #this is how method in ruby works
        #not putting guest in the end, will not return all the data above, rather it just returns guest.email
        #putting the guest object in the end, ensures the entire guest object is returned.
  end



end
