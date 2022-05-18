class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :update, :destroy, :edit]

  def index
    @profiles = Profile.all
  end

  def show
    @feedbacks = Feedback.where("profile_id = ?", params[:id])
    @requests = Request.where("profile_id = ?", params[:id])
  end

  def new
    @profiles = current_user.build_profile
  end

  def create
    profile = current_user.build_profile(profile_params2)
    if profile.save!
      redirect_to profile, notice: "successfully created Profile!"
    else
      redirect_to profile, notice: "Profile not created!"
    end
  end

  def edit
  end

  def update
    @profile.update(profile_params)
    redirect_to profile_path
  end

  def destroy
    @profile.destroy
    redirect_to profiles_path
  end

  private
  
  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    return params.require(:profile).permit(:name, :phone_number, :australian_state, :user_id)
  end

  def profile_params2
    return params.permit(:name, :phone_number, :australian_state, :user_id)
  end
end

