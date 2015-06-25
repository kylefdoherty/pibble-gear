class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

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
    @comment = Comment.new
  end

  def index
    @products = Product.all
  end

  def edit
  end

  def update
    @product.update(product_params)

    redirect_to @product
  end

  def destroy
    @product.delete

    redirect_to root_path
  end


  private

    def authenticate_admin!
      redirect_to root_path unless authenticate_user! && current_user.admin
      flash[:notice] = "You must be an admin to access this page"
    end

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :affiliate_link, :large_image_link, :small_image_link, :price, :product_image)
    end
end
