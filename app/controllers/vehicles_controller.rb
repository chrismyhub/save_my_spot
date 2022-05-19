class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :update, :destroy, :edit]
  before_action :set_user, only: [:show, :destroy, :create, :new, :index]

  def index
    @vehicles = Vehicle.all
    @profile = Profile.find(@profile_id)
  end

  def show
    @profile = Profile.find(@profile_id)
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @profile = Profile.find(@profile_id)
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
    @profile = Profile.find(@profile_id)
    @vehicle.destroy
    redirect_to @profile
  end


 private

  def set_user
    @profile_id = current_user.profile.id
  end

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    return params.require(:vehicle).permit(:vehicle_type, :color, :license_plate, :make, :year, :comments, :profile_id)
  end

end

