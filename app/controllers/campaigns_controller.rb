class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all.order(created_at: :desc)
    render json: @campaigns
  end

  def show
    @campaign = Campaign.find params[:id]
    render json: @campaign
  end
end
