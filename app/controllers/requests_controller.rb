class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :update, :destroy, :edit]
  before_action :set_user, only: [:new, :edit]

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
    # p'=============================='
    # p params
    # p'=============================='
    # @profile = Profile.find(params[:id])
    # @request = @profile.requests.build(request_params)
    # @request.save!
    # redirect_to @request
      #   redirect_to request, notice: "successfully created Request!"
      # else
      #   redirect_to request, notice: "Request not created!"
      # end
  end

  def edit
  end

  def update
    @request.update(request_params)
    redirect_to request_path
  end

  def destroy
    # @request.image.purge
    @request.destroy
    # authorize @request
    # @request.destroy
    redirect_to requests_listing_path
  end

  private

  def set_user
    @profile_id = current_user.profile.id
  end

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    return params.require(:request).permit(:location, :australian_state, :date, :time, :reward, :no_show_penalty, :comments, :profile_id, :image)
  end
end
