class PortfoliosController < ApplicationController

  before_action :set_portfolio_item, only: [:edit, :show, :update, :destroy]
  layout "portfolio"
    
  def index
    @portfolio_items = Portfolio.all
  end

  def angular
    @portfolio_item_angular = Portfolio.angular
  end 
  def new 
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end
  def create
    @portfolio_item = Portfolio.new(portfolio_params) #standalone terms like blog_params is method/var

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your Portfolio is on the web' }
      else
        format.html { render :new } 
      end
    end
  end

  def edit
    
  end

  def update

    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def show

  end

  def destroy
    #this performs the lookup

    #destroy/delete the record
    @portfolio_item.destroy

    #Redirect 
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private #the following method is private to this class, means it cannot be called by any other class but this.

  def portfolio_params
    
    params.require(:portfolio).permit(:title, 
                                      :subtitle,
                                      :body, 
                                      technologies_attributes: [:name])

  end

  def set_portfolio_item 
    @portfolio_item = Portfolio.find(params[:id])
  end




end
