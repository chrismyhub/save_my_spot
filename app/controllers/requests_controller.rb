class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :update, :destroy, :edit]

  def index
    @requests = Request.all
  end

  def show
  end

  def new
    @request = Request.new
  end

  def listing
    @requests = Request.all
  end

  def create
    # @profile = Profile.find(params[:profile_id])
    # @request = @profile.request.build(request_params)
    # @request.user_id = current_user.id
    request = Request.new(request_params)
    if request.save!
      redirect_to request, notice: "successfully created Request!"
    else
      redirect_to request, notice: "Request not created!"
    end
  end

  def edit
  end

  def update
    @request.update(request_params)
    redirect_to request_path
  end

  def destroy
    @request.destroy
    redirect_to requests_listing_path
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    return params.require(:request).permit(:location, :australian_state, :date, :time, :reward, :no_show_penalty, :comments, :profile_id)
  end
end
