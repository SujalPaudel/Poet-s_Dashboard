class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId 
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body, :topic_id #doesnt allow to create a blog post unless we have.

  belongs_to :topic

  has_many :comments, dependent: :destroy #if I delete a blogpost, I want all the comments in that blogpost to be deleted, we dont want a comment that doesnt have a parent blog

  def self.special_blogs
    all
  end

  def self.featured_blogs
    limit(2)
  end

  def self.recent
    order("created_at DESC")
  end

end

#this is the setup needed to be done for using the FriendlyId gem
#self denotes the independent blogs, each individual blogs.