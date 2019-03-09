class CampaignsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @campaigns = Campaign.all.order(created_at: :desc)
    data = []
    @campaigns.each do |campaign|
      @dm = User.find(campaign.user_id)
      @campaign_card = {
        campaign: campaign,
        dm: { name: @dm.name }
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
    data = {
      campaign: @campaign,
      dm: { name: @dm.name },
      players: @players,
      join_requests: @fullrequests
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
    )
  end
end
