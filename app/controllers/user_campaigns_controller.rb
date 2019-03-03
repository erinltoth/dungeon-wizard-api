class UserCampaignsController < ApplicationController
  def show
    @usercampaign = UserCampaign.find params[:id]
    render json: @usercampaign
  end

  def new
    @usercampaign = UserCampaign.new
  end

  def create
    @usercampaign = UserCampaign.new
    if @usercampaign.save
      redirect_to [:campaigns], notice: 'Joined Campaign!'
    else
      redirect_to [:campaigns], notice: 'Something went wrong...'
    end
  end

  def destroy
    @usercampaign = UserCampaign.find params[:id]
    @usercampaign.destroy
    redirect_to [:campaigns], notice: 'Removed from campaign.'
  end
end
