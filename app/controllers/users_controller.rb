class UsersController < ApplicationController
  def index
    @users = User.all
    puts 'UsersController ---> INDEX'
    puts @users
    render json: @users
  end
end
