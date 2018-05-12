class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? } #data_validations

  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular #referencing the current version of portfolio, this particular portfolio item
    where(subtitle: 'Angular')
  end 
  
  def self.rails
    where(subtitle: 'Ruby On Rails')
  end

  def self.by_position
    order("position ASC")
  end

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
end



#This is the Model, The M of MVC model in ruby on the rails

#||= ??
#if self.main_image == nil
#  self.main_image = "http://via.placeholder.com/600x400"

