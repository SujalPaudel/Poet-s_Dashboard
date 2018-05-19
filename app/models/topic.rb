class Topic < ApplicationRecord
  validates_presence_of :title

  has_many :blogs

  def self.with_blogs #return only those topics with blogs
    includes(:blogs).where.not(blogs: {id: nil})
    

  end


end
