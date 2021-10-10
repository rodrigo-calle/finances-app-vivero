class FinancesController < ApplicationController
    def index
        @finances = Finance.all
    end

    def new 
        @finance = Finance.new
    end

    def show 
        @finance = Finance.find(params[:id])
    end

    def create   
      @finance = Finance.new(finance_params)   
        if @finance.save   
            flash[:notice] = 'Registro añadido!'   
            redirect_to root_path   
        else   
            flash[:error] = 'Failed to edit !'   
            render :new   
    end   
  end   
    
    # GET method for editing a product based on id   
    def edit   
        @finance = Finance.find(params[:id])   
    end   
      # PUT method for updating in database a product based on id   
    def update   
        @finance = Finance.find(params[:id])   
        if @finance.update_attributes(finance_params)   
            flash[:notice] = 'Finance updated!'   
            redirect_to root_path   
        else   
            flash[:error] = 'Failed to edit finance!'   
            render :edit   
        end   
    end   
      # DELETE method for deleting a product from database based on id   
  def destroy   
    @finance = Finance.find(params[:id])   
    if @finance.delete   
      flash[:notice] = 'Product deleted!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to delete this product!'   
      render :destroy   
    end   
  end   
   
  # we used strong parameters for the validation of params   
  def finance_params   
    params.require(:finance).permit(:description, :price, :amount, :day, :category_id)   
  end   
   
    

end
