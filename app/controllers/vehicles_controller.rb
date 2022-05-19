class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :update, :destroy, :edit]
  before_action :set_user, only: [:show, :destroy]

  def index
  end

  def show
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.create!(vehicle_params)
    redirect_to @vehicle
  end

  def edit
  end

  def update
    @vehicle.update(vehicle_params)
    redirect_to @vehicle
  end

  def destroy
    @vehicle.destroy
    redirect_to @profile
  end


 private

  def set_user
    @profile_id = current_user.profile.id
    @profile = Profile.find(params[:profile_id])
  end

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    return params.require(:vehicle).permit(:type, :color, :license_plate, :make, :year, :comments, :profile_id, :request_id)
  end

end

