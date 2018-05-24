class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  before_action :set_sidebar_topics, except:[:update, :create, :destroy, :toggle_status] #designed only for GET request.

  layout "blog" 
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status]}, site_admin: :all


  #layout is a method, with blog as a argument also can do layout("blog")
  #the method in rails is called as actions
  # GET /blogs
  # GET /blogs.json

  def index
    
    if logged_in?(:site_admin)
      @blogs = Blog.recent.page(params[:page]).per(5) #to limit 5 blogs per pages, fetching it from the database.
    else
      @blogs = Blog.published.recent.page(params[:page]).per(5)
    end
    @page_title = "My Personal Blogs"

  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    if logged_in?(:site_admin) || @blog.published?
      @blog = Blog.includes(:comments).friendly.find(params[:id]) #it allows us to include not only blog but also comment associated with it
      @comment = Comment.new  #now that we have the blog found, we also need to render the comments out

      @page_title = @blog.title
      @seo_keywords = @blog.body
    else
      redirect_to blogs_path, notice: 'You are not authorized to access this page'
    end
  end

  # GET /blogs/new
  def new 
    @blog = Blog.new #its related to making the new form available
  end

  # GET /blogs/1/edit
  def edit #just makes the form availvble
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params) #standalone terms like blog_params is method/var

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Your Blog is on the web' } #If the request wants an HTML page
      else
        format.html { render :new } 
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def toggle_status
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end
    redirect_to blogs_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params #makes availabe to create and update the value supplied from new and edit
      params.require(:blog).permit(:title, :body, :topic_id, :status)
    end

    def set_sidebar_topics
      @side_bar_topics = Topic.with_blogs
    end



end


