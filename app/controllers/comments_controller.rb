class CommentsController < ApplicationController
  before_action :set_product

  def new
    @comment = Comment.new
  end

  def create

    @comment = @product.comments.build(comment_params)
    @comment.update(user: current_user)

    if @comment.save
      redirect_to @product
    else
      flash[:error] = "Something went wrong and comment wasn't created."
      redirect_to :back
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

    def set_product
      @product = Product.find(params[:product_id])
    end
end
