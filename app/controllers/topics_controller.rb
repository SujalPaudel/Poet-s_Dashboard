class TopicsController < ApplicationController
  layout 'blog'
  
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])

    if logged_in?(:site_admin)
      @blogs = @topic.blogs.recent.page(params[:page]).per(5) #to limit 5 blogs per pages, fetching it from the database.
    else
      @blogs = @topic.blogs.published.recent.page(params[:page]).per(5)
    end
  end
end