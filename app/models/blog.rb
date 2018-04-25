class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId 
  friendly_id :title, use: :slugged
end

#this is the setup needed to be done for using the FriendlyId gem