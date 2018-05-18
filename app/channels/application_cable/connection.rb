module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def guest_user
      guest = GuestUser.new
      guest.id = guest.object_id
      guest.name = "Guest User"
      guest.first_name = "Guest"
      guest.last_name = "User"
      guest.email = "guest@user.com"
      guest
    end



    def connect
      self.current_user = find_verified_user || guest_user
      logger.add_tags 'ActionCable', current_user.email
      logger.add_tags 'ActionCable', current_user.id
      #logger enables to print the logged in content of the user in terminal when connection starts
      #helps to track the error if occurs any?

    end

    protected

    def find_verified_user
      if verified_user = env['warden'].user #hey, devis can you let us know this user is logged in?
        verified_user
      end
    end
  end
end
