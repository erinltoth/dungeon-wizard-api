class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all.order(created_at: :desc)
    render json: @campaigns
  end

  def show
    @campaign = Campaign.find params[:id]
    render json: @campaign
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)

    if @campaign.save
      redirect_to [:campaigns], notice: 'Campaign created!'
    else
      redirect_to [:campaigns], notice: 'Something went wrong...'
    end
  end

  def destroy
    @campaign = Campaign.find params[:id]
    @campaign.destroy
    redirect_to [:campaigns], notice: 'Campaign deleted!'
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
