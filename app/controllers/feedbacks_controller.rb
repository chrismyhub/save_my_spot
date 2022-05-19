class FeedbacksController < ApplicationController
    before_action :set_feedback_profile, only: [:create, :destroy, :edit]
    
    def create  
        @feedback = @profile.feedbacks.build(feedback_params)
        @feedback.user_id = current_user.id
        if @feedback.save!
            redirect_to @profile, notice: "successfully posted!"
        else
            redirect_to @profile, notice: "did not save!"
        end
    end

    def edit
    end

    def show
        destroy
    end

    def destroy
        @feedback = @profile.feedbacks.find(params[:id])
        @feedback.destroy
        redirect_to @profile
    end

    private

    def set_feedback_profile
        @profile = Profile.find(params[:profile_id])
    end

    def feedback_params
        params.require(:feedback).permit(:comment, :rating, :user_id, :profile_id)
    end
end
