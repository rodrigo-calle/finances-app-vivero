class CategoriesController < ApplicationController
 def index
        @categories = Category.all
    end

    def new 
        @category = Category.new
    end

    def show 
        @category = Category.find(params[:id])
    end

    def create   
      @category = Category.new(category_params)   
        if @category.save   
            flash[:notice] = 'Registro añadido!'   
            redirect_to root_path   
        else   
            flash[:error] = 'Failed to edit !'   
            render :new   
    end   
  end   
    
    # GET method for editing a product based on id   
    def edit   
        @category = Category.find(params[:id])   
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
    @category = Category.find(params[:id])   
    if @category.delete   
      flash[:notice] = 'Product deleted!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to delete this product!'   
      render :destroy   
    end   
  end   
   
  # we used strong parameters for the validation of params   
  def category_params   
    params.require(:category).permit(:name)   
  end   
   
end
