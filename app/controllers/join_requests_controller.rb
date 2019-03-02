class JoinRequestsController < ApplicationController
  def index
    @requests = JoinRequest.all
    render json: @requests
  end

  def show
    @join_request = JoinRequest.find params[:id]
    render json: @join_request
  end

  def new
    @join_request = JoinRequest.new
  end

  def create
    @join_request = JoinRequest.new(join_request_params)
  end

  private

  def join_request_params
    params.require(:campaign).permit(
    )
end
