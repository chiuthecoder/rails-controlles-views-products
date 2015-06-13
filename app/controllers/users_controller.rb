class UsersController < ApplicationController
  def index
    # show all users
    @users = User.all
  end

  def new
    # show form to create a user
    #@user = User.new
  end

  def create
    # adds a user to db
    # puts  params[:user][:first_name]
    @user = User.create( user_params )
    redirect_to '/'
  end

  def show
    # show one user
    @user = User.find(params[:id])
  end

  def edit
    # show form to edit user
    @user = User.find(params[:id])
  end

  def update
    #send update to db
    @user = User.find(params[:id])
    @user.update( user_params )
    redirect_to '/'
  end

  def destroy
    #destory from the db
    @user = User.find(params[:id])
    @user.destroy
    redirect_to '/'
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
