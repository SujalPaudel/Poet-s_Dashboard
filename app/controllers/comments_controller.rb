class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(comment_params) #comment_params are our strong params
  end

  private

  def comment_params
    params.require(:comment).permit(:content) #params requires comment and we are whitelisting content that is coming through
  end

end



#The keyword private tells Ruby that all methods defined from now on, are supposed to be private. They can be called from within the object (from other methods that the class defines), but not from outside.