class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find params[:id]
    render json: @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to [:campaigns], notice: 'Account created!'
    else
      redirect_to [:campaigns], notice: 'Something went wrong'
    end
  end
end
