class FeedbacksController < ApplicationController

    def index
      @feedbacks = Feedback.all
    end

    def create  
        @profile = Profile.find(params[:profile_id])
        @feedback = @profile.feedback.build(comment_params)
        @feedback.user_id  = current_user.id
    end

    def destroy
    end

    private

    def feedback_params
        params.require(:feedback).permit(:feedback)
    end
end
