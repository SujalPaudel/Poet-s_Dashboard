class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  layout "blog" 
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status]}, site_admin: :all


  #layout is a method, with blog as a argument also can do layout("blog")
  #the method in rails is called as actions
  # GET /blogs
  # GET /blogs.json

  def index
    
    @blogs = Blog.special_blogs

    @page_title = "My Personal Blogs"

  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @page_title = @blog.title
    @seo_keywords = @blog.body
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
        format.html { redirect_to @blog, notice: 'Your Blog is on the web' }
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
      

    #byebug(dont put this permanently, it will stop the sys from running) #using the gem of byebug
    redirect_to blogs_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params #makes availabe to create and update the value supplied from new and edit
      params.require(:blog).permit(:title, :body)
    end
end
