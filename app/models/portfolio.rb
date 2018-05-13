class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? } #data_validations

  validates_presence_of :title, :body

  #mount_uploader tells portfolio it needs to call carrierwave, it is special method provided by carrierwave
  #Uploader is going to apply to the thumb_image
  #it is going to use the PortfolioUploader



  mount_uploader :thumb_image, PortfolioUploader #this is being explicit about the Uploader to be used
  mount_uploader :main_image, PortfolioUploader
  

  def self.angular #referencing the current version of portfolio, this particular portfolio item
    where(subtitle: 'Angular')
  end 
  
  def self.rails
    where(subtitle: 'Ruby On Rails')
  end

  def self.by_position
    order("position ASC")
  end
  
end



#This is the Model, The M of MVC model in ruby on the rails

#||= ??
#if self.main_image == nil
#  self.main_image = "http://via.placeholder.com/600x400"

