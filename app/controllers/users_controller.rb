class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @users = User.all.order(created_at: :desc)
    data = []
    @users.each do |user|
      @owned_campaigns = Campaign.where(["user_id = ?", user.id])
      @campaigns = JoinRequest.where(["user_id = ? and dm_confirm = ?", user.id,  "accepted"])
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
    @campaigns_full = []
    @campaigns.each do |campaign|
      @all_playing_styles = [
        { style: "deep_immersion", activated: campaign.deep_immersion },
        { style: "sandbox", activated: campaign.sandbox },
        { style: "battle_focused", activated: campaign.battle_focused },
        { style: "kick_in_the_door", activated: campaign.kick_in_the_door },
        { style: "exploration", activated: campaign.exploration },
        { style: "random", activated: campaign.random }
      ]
      @filtered_playing_styles = @all_playing_styles.select { |style| style[:activated] == true }
      @playing_styles = @filtered_playing_styles.collect { |style| style[:style] }
      @campaigns_full.push({
        campaign: campaign,
        active_playstyles: @playing_styles
      })
    end
    @owned_campaigns = Campaign.where(["user_id = ?", @user.id])
    @owned_campaigns_full = []
    @owned_campaigns.each do |campaign|
      @all_playing_styles = [
        { style: "deep_immersion", activated: campaign.deep_immersion },
        { style: "sandbox", activated: campaign.sandbox },
        { style: "battle_focused", activated: campaign.battle_focused },
        { style: "kick_in_the_door", activated: campaign.kick_in_the_door },
        { style: "exploration", activated: campaign.exploration },
        { style: "random", activated: campaign.random }
      ]
      @filtered_playing_styles = @all_playing_styles.select { |style| style[:activated] == true }
      @playing_styles = @filtered_playing_styles.collect { |style| style[:style] }
      @owned_campaigns_full.push({
        campaign: campaign,
        active_playstyles: @playing_styles
      })
    end
    @join_requests = JoinRequest.where(["user_id = ?", @user.id])
    data = {
      user: @user,
      campaigns: @campaigns_full,
      owned_campaigns: @owned_campaigns_full,
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
