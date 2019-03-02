class JoinRequestsController < ApplicationController
  def index
    @requests = JoinRequest.all
    render json: @requests
  end

  def show
    @join_request = JoinRequest.find params[:id]
    render json: @join_request
  end
end
