class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all.order(created_at: :desc)
    puts 'UsersController ---> INDEX'
    puts @campaigns
    render json: @campaigns
  end
end
