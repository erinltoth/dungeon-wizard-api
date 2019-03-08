class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @users = User.all.order(created_at: :desc)
    data = []
    @users.each do |user|
      @owned_campaigns = Campaign.where(["user_id = ?", user.id])
      @campaigns = JoinRequest.where(["user_id = ? and dm_confirm = ?", user.id,  "accepted"])
      puts @campaigns
      @user_card = {
        user: user,
        campaigns: @campaigns.collect { |campaign| campaign.id },
        owned_campaigns: @owned_campaigns.collect { |campaign| campaign.id }
      }
      data.push(@user_card)
    end
    render json: data
  end

  def show
    @user = User.find params[:id]
    @memberships = JoinRequest.where(["user_id = ? and dm_confirm = ?", @user.id, "accepted"])
    @campaigns = @memberships.collect { |membership| Campaign.find(membership.campaign_id) }
    @owned_campaigns = Campaign.where(["user_id = ?", @user.id])
    @join_requests = JoinRequest.where(["user_id = ?", @user.id])
    data = {
      user: @user,
      campaigns: @memberships,
      owned_campaigns: @owned_campaigns,
      join_requests: @join_requests
    }
    render json: data
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { id: @user.id, username: @user.name }
    else
      render json: 'Something went wrong...'
    end
  end

  def update
    @user = User.find params[:id]
    if @user.update(user_params)
      render json: 'Account updated!'
    else
      render json: 'Update failed'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :playing_style,
      :exp_level,
      :avatar
    )
  end
end
