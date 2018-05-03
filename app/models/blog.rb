class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId 
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body #doesnt allow to create a blog post unless we have.

  belongs_to :topic

  def self.special_blogs
    all
  end

  def self.featured_blogs
    limit(2)
  end

end

#this is the setup needed to be done for using the FriendlyId gem
#self denotes the independent blogs, each individual blogs.