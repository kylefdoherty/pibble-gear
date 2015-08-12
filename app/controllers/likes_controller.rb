class LikesController < ApplicationController
    before_action :set_product

  def create
    @like = Like.create(product_id: params[:product_id], user_id: current_user.id)

    redirect_to @product
  end

  private

    def set_product
      @product = Product.find(params[:product_id])
    end
end
