class LikesController < ApplicationController
    before_action :set_product

  def create
    @like = Like.create(product_id: params[:product_id])

    redirect_to @product
  end

  private

    def like_params
      params.require(:like).permit(:product_id)
    end

    def set_product
      @product = Product.find(params[:product_id])
    end
end
