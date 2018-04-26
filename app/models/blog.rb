class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId 
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body #doesnt allow to create a blog post unless we have.

  belongs_to :topic
end

#this is the setup needed to be done for using the FriendlyId gem