class RequestsController < ApplicationController
  skip_before_action :verify_authenticity_token
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
    # @request.profile_id = current_profile.id

    # @post = Post.find(params[:post_id])
    # @comment = @post.comments.build(params[:comment].permit(:comment))
    # @comment.user_id = current_user.id
    # @comment.save!

    # @request = Profile.find(params[:profile_id]).requests.new(params[:request])
    # @requests = Request.where("profile_id = ?", params[:id])
    # request = Request.new(request_params)

    # @profile = Profile.find(params[:profile_id])
    # @request = current_user.requests.build(request_params)
    # @request.profile_id = @profile.id

    # @profile = Profile.find(params[:profile_id])
    @profile = Profile.where("profile_id = ?", params[:id])
    @request = current_user.requests.build(request_params)
    @request.profile_id = @profile.id
      if @request.save!
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
