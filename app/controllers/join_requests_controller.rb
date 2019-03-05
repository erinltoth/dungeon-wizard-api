class JoinRequestsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
    @join_request = JoinRequest.find params[:id]
    render json: @join_request
  end

  def new
    @join_request = JoinRequest.new
  end

  def create
    @join_request = JoinRequest.new(join_request_params)

    if @join_request.save
      redirect_to [:campaigns], notice: 'Join request sent!'
    else
      redirect_to [:campaigns], notice: 'Something went wrong...'
    end
  end

  def destroy
    @join_request = JoinRequest.find params[:id]
    @join_request.destroy
    redirect_to [:campaigns], notice: 'Join request deleted!'
  end

  private

  def join_request_params
    params.require(:campaign).permit(
      :message,
      :player_confirm,
      :dm_confirm
    )
end
