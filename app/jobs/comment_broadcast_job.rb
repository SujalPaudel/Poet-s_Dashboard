class CommentBroadcastJob < ApplicationJob #we have a comment that we are broadcasting a job on
  queue_as :default #this is a list that stores comments on queue


  def perform(comment) #this method takes the comment #I want to start broadcast on action cable with channel with the given blog id, on that channel render comment
    ActionCable.server.broadcast "blogs_#{comment.blog.id}_channel", comment: render_comment(comment)
  end

  private

  def render_comment(comment)#call the comment controller, and pass the variable comment that is to be render 
    CommentsController.render partial: 'comments/comment', locals: { comment: comment }
  end
end