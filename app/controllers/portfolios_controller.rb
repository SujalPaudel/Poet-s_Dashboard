class PortfoliosController < ApplicationController
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
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    #this performs the lookup
    @portfolio_item = Portfolio.find(params[:id])

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


end
