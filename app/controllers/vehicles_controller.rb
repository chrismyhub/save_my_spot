class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :update, :destroy, :edit]
  before_action :set_user, only: [:show, :create, :new, :index]
  before_action :find_profile, only: [:index, :show, :create]

  def index
    @vehicles = Vehicle.all
  end

  def show
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.create!(vehicle_params2)
    redirect_to vehicles_url
  end

  def edit
  end

  def update
    @vehicle.update(vehicle_params)
    redirect_to vehicle_path
  end

  def destroy
    # @profile = Profile.find(params[:profile_id])
    # @vehicle = @profile.find(params[:id])
    @vehicle.destroy!
    redirect_to vehicles_path
  end


 private
  def find_profile
    @profile = Profile.find(@profile_id)
  end

  def set_user
    @profile_id = current_user.profile.id
  end

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    return params.require(:vehicle).permit(:vehicle_type, :color, :license_plate, :make, :year, :comments, :vehicle_id)
  end

  def vehicle_params2
    return params.require(:vehicle).permit(:vehicle_type, :color, :license_plate, :make, :year, :comments, :vehicle_id, :profile_id)
  end

end

