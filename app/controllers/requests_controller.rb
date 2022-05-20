class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :update, :destroy, :edit]
  before_action :set_user, only: [:new, :edit]
  before_action :find_profile, only: [:edit]
  before_action :find_vehicle, only: [:show]

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
    @request = Request.create!(request_params)
    redirect_to @request
  end

  def edit
    @vehicles = Vehicle.all
  end

  def update
    @request.update(request_params)
    redirect_to request_path
  end

  def destroy
    #NOTE: purge doesn't seem to be working.
    # @request.image.purge
    @request.destroy
    redirect_to requests_listing_path
  end

  private

  def find_vehicle
    @vehicle = Vehicle.all
  end

  def find_profile
    @profile = Profile.find(@profile_id)
  end

  def set_user
    @profile_id = current_user.profile.id
  end

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    return params.require(:request).permit(:location, :australian_state, :date, :time, :reward, :no_show_penalty, :comments, :profile_id, :vehicle_id, :image)
  end
end
