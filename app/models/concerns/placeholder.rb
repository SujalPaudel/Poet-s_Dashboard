module Placeholder
  extend ActiveSupport::Concern #helps to load in the helper module, which allows us to do many more thing

  def self.image_generator(height:, width:) #this is the helper method
    "http://via.placeholder.com/#{height}x#{width}"
  end
end
