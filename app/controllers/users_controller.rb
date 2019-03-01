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

  def update
    @user = User.find params[:id]
    if @user.update(user_params)
      redirect_to @user
    else
      puts 'User update failed :('
      redirect_to @user
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :playing_style,
      :exp_level
    )
  end
end
