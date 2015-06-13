class CommentsController < ApplicationController
  def index
    @comments = Comment.all.joins(:product).select("comment","name","product_id")
    # @product = Product.all
  end

  def new
  end

  def create
    @comment = Comment.create( comment_params)
    redirect_to '/'
  end

  def show
    # show one 
    @comments = Comment.all
    @product = Product.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    #destory from the db
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to '/'
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :product_id)
  end
end
