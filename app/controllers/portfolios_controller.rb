class PortfoliosController < ApplicationController
  def index
  @portfolio_items = Portfolio.all
  end

  def ruby
    @ruby_portfolio_items = Portfolio.ruby
  end

  def new 
    @portfolio_item = Portfolio.new
  end


  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if  @portfolio_item.save
        # go redirect to path with all portfolios
        format.html { redirect_to portfolios_path, notice: "Your Portfolio is now live." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit 
    @portfolio_item = Portfolio.find(params[:id])
  end
  
  def show
    @portfolio_item = Portfolio.find(params[:id])
  end
  
  def update
    @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: "Record was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    # lookup the item
    @portfolio_item = Portfolio.find(params[:id])
    # destroy the item (delete wrapped in a transaction)
    @portfolio_item.destroy
    # perform redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: "Record was successfully deleted." }
    end
  end

end
