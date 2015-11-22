class ServiceRequestsController < ApplicationController
  before_action :set_service_request, only: [:show, :edit, :update, :destroy]

  # GET /service_requests
  # GET /service_requests.json
  def index
    if logged_in?
      if current_user.is_provider
        @service_requests = ServiceRequest.all
      else
        @service_requests = current_user.service_requests
      end
    else
      flash[:danger] = "Please login to view this page"
      redirect_to login_path
    end
  end

  # GET /service_requests/1
  # GET /service_requests/1.json
  def show
    @quote = Quote.new
    @accepted_quote = @service_request.quotes.find_by(status: "Accepted")
  end

  # GET /service_requests/new
  def new
    @user = User.find(session[:user_id])
    @services = Service.order(:name) # probably needed whenever you show the edit/new form
    @service_request = ServiceRequest.new if logged_in?
  end

  # GET /service_requests/1/edit
  def edit
  end

  # POST /service_requests
  # POST /service_requests.json
  def create
    @service_request = ServiceRequest.new(service_request_params)
    @service_request.services << Service.find(service_request_service[:services].to_i)
    @service_request.user_id = current_user.id
    @service_request.status = "Open"

    respond_to do |format|
      if @service_request.save
        format.html { redirect_to  user_service_requests_path, success: 'Service request was successfully created.' }
        format.json { render :show, status: :created, location: @service_request }
      else
        format.html { render :new }
        format.json { render json: @service_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_requests/1
  # PATCH/PUT /service_requests/1.json
  def update
    respond_to do |format|
      if @service_request.update(service_request_params)
        format.html { redirect_to user_service_requests, flash[:success] = 'Service request was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_request }
      else
        format.html { render :edit }
        format.json { render json: @service_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_requests/1
  # DELETE /service_requests/1.json
  def destroy
    @service_request.destroy
    respond_to do |format|
      format.html { redirect_to service_requests_url, notice: 'Service request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_request
      @service_request = ServiceRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_request_params
      params.require(:service_request).permit(:additional_notes, :user_id, :status, :image)
    end

    def service_request_service
      params.require(:service_request).permit(:services)
    end
end
