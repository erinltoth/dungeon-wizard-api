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
    data = {
      campaign: @campaign,
      dm: { name: @dm.name }
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
      :location
    )
  end
end
