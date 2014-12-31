class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = "Product created"
      redirect_to @product
    else
      flash[:error] = "Something went wrong and product wasn't created."
      redirect_to :back
    end
  end

  def show
    @product = Product.find(params[:id])
  end


  private

    def product_params
      params.require(:product).permit(:name, :description, :amazon_link)
    end
end





