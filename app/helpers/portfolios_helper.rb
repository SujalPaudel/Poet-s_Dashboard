module PortfoliosHelper
  def image_generator(height:, width:) #this is the helper method
    "http://via.placeholder.com/#{height}x#{width}"
  end

  def portfolio_image img, type
    if img
      img
    elsif type == 'thumb'
      image_generator(height: '350', width: '200')
    else
      image_generator(height: '600', width: '400')
    end
  end    
end


