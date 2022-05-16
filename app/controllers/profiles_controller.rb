class ProfilesController < ApplicationController

  def index
    @profiles = Profile.all
  end

  def show
  end

  def new
    @profiles = Profile.new
  end

  def listing
    @profiles = Profile.all
  end

  def create
      profile = Profile.new(profile_params)
      profile.save!
      redirect_to profile
  end

  def edit
  end

  def update
    @profile.update(profile_params)
    redirect_to profile_path
  end

  def destroy
    @profile.destroy
    redirect_to profile_listing_path
  end

  private
  
  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    return params.require(:profile).permit(:name, :phone_number, :australian_state)
  end
end
