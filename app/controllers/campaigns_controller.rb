class CampaignsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @campaigns = Campaign.all.order(created_at: :desc)
    data = []
    @campaigns.each do |campaign|
      @dm = User.find(campaign.user_id)
      @players = JoinRequest.where(["campaign_id = ?", campaign.id])
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
      @campaign_card = {
        campaign: campaign,
        dm: { name: @dm.name },
        players: @players,
        playing_styles: @playing_styles
      }
      data.push(@campaign_card)
    end
    render json: data
  end

  def show
    @campaign = Campaign.find params[:id]
    @dm = User.find(@campaign.user_id)
    @memberships = JoinRequest.where(["campaign_id = ? and dm_confirm = ?", @campaign.id, "accepted"])
    @players = @memberships.collect { |membership| User.find(membership.user_id) }
    @joinrequests = JoinRequest.where(["campaign_id = ?", @campaign.id])
    @fullrequests = @joinrequests.collect { |request|
      {request: request, user: User.find(request.user_id)}
    }
    @all_playing_styles = [
        { style: "deep_immersion", activated: @campaign.deep_immersion },
        { style: "sandbox", activated: @campaign.sandbox },
        { style: "battle_focused", activated: @campaign.battle_focused },
        { style: "kick_in_the_door", activated: @campaign.kick_in_the_door },
        { style: "exploration", activated: @campaign.exploration },
        { style: "random", activated: @campaign.random }
      ]
      @filtered_playing_styles = @all_playing_styles.select { |style| style[:activated] == true }
      @playing_styles = @filtered_playing_styles.collect { |style| style[:style] }
    data = {
      campaign: @campaign,
      dm: { name: @dm.name },
      players: @players,
      join_requests: @fullrequests,
      playing_styles: @playing_styles
    }
    render json: data
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)

    if @campaign.save
      render json: @campaign.id
    else
      render json: 'Something went wrong...'
    end
  end

  def update
    @campaign = Campaign.find params[:id]
    if @campaign.update(campaign_params)
      render json: 'Campaign updated!'
    else
      render json: 'Update failed'
    end
  end

  def destroy
    @campaign = Campaign.find params[:id]
    @campaign.destroy
    render json: 'Campaign deleted!'
  end

  private

  def campaign_params
    params.require(:campaign).permit(
      :name,
      :user_id,
      :description,
      :location,
      :playing_style,
      :exp_level,
      :player_limit,
      :synopsis,
      :next_session,
      :avatar,
      :image,
      :commitment,
      :kick_in_the_door,
      :deep_immersion,
      :sandbox,
      :battle_focused,
      :exploration,
      :random
    )
  end
end
