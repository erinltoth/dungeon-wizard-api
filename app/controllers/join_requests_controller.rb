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
      render json: @join_request
    else
      redirect_to [:campaigns], notice: 'Something went wrong...'
    end
  end

  def update
    @join_request = JoinRequest.find params[:id]
    if @join_request.update(join_request_params)
      render json: 'Account updated!'
    else
      render json: 'Update failed'
    end
  end

  def destroy
    @join_request = JoinRequest.find params[:id]
    @join_request.destroy
    redirect_to [:campaigns], notice: 'Join request deleted!'
  end

  private

  def join_request_params
    params.permit(
      :join_request,
      :message,
      :player_confirm,
      :dm_confirm,
      :user_id,
      :campaign_id
     
    )
  end
end
