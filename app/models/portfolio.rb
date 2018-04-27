class Portfolio < ApplicationRecord

  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular #referencing the current version of portfolio, this particular portfolio item
    where(subtitle: 'Angular')
  end 
  
  def self.rails
    where(subtitle: 'Ruby On Rails')
  end

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= "http://via.placeholder.com/600x400"
    self.thumb_image ||= "http://via.placeholder.com/350x200"

  end


end



#This is the Model, The M of MVC model in ruby on the rails

#||= ??
#if self.main_image == nil
#  self.main_image = "http://via.placeholder.com/600x400"
