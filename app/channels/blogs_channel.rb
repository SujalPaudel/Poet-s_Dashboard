class BlogsChannel < ApplicationCable::Channel

  def subscribed
    stream_from "blogs_#{params['blog_id']}_channel" #create a channel #blogs_4_channel #the channel itself is a stream
  end

  def unsubscribed
    #leaving the watching channel is considered as unsubscribing  
  end

  def send_comment(data)
    current_user.comments.create!(content: data['comment'], blog_id: data['blog_id'])
  end


end


#content: attributes