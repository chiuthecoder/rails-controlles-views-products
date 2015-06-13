class ProductsController < ApplicationController
  def index
    # show all users
    @products = Product.all
    # @categories = Category.all
  end

  def new
    # show form to create a user
    #@user = User.new
    @categories = Category.all
    #params[:category][:id]
  end

  def create
    # adds a user to db
    # puts  params[:user][:first_name]
    
    @product = Product.create( product_params )
    # @category = Category.create( category_params )
    redirect_to '/'
  end

  def show
    # show one user
    @categories = Category.all
    @product = Product.find(params[:id])
  end

  def edit
    # show form to edit user
    @categories = Category.all
    @product = Product.find(params[:id])
  end

  def update
    #send update to db
    @product = Product.find(params[:id])
    @product.update( product_params )
    redirect_to '/'
  end

  def destroy
    #destory from the db
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to '/'
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id)
  end
  # def category_params
  #   params.require(:category).permit(:name)
  # end
end
