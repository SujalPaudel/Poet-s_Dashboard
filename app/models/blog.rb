class Blog < ApplicationRecord
  extend FriendlyId 
  friendly_id :title, use: :slugged
end

#this is the setup needed to be done for using the FriendlyId gem