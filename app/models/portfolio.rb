class Portfolio < ApplicationRecord

  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular #referencing the current version of portfolio, this particular portfolio item
    where(subtitle: 'Angular')
  end 
  
  def self.rails
    where(subtitle: 'Ruby On Rails')
  end



end
