class ServiceRequestsController < ApplicationController
  before_action :set_service_request, only: [:show, :edit, :update, :destroy, :set_status]

  # GET /service_requests
  # GET /service_requests.json
  def index
    @user = User.find(session[:user_id])
    @services = Service.order(:name) # probably needed whenever you show the edit/new form
    @service_request = ServiceRequest.new if logged_in?

    if logged_in?
      if current_user.is_provider
        # Show all services requests if the user is a provider
        # Search is a named scope in the ServiceRequest model
        @service_requests = ServiceRequest.all.search(params[:keyword])
      else
        # If the user is a NOT a provider, only show the user's service requests
        @service_requests = current_user.service_requests.search(params[:keyword])
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
    @review = Review.new
    @accepted_quote = @service_request.quotes.find_by(status: "Accepted")
    @completed_quote = @service_request.quotes.find_by(status: "Completed")
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
    # Add the selected services to the service request
    @service_request.services << Service.find(service_request_service[:services].to_i)
    @service_request.user_id = current_user.id
    # When a service request is created, it's status is set to "Open"
    @service_request.status = "Open"

    # Call generate_order_number method in the ServiceRequest model to get a value for the order number
    @service_request.generate_order_number

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

  # Providers can update the status of the service request.  This is handled via a button in the view.
  def set_status
    type = params[:type]
    if type == "In Progress"
      @service_request.status = "In Progress"
    elsif type == "Completed"
      @service_request.status = "Completed"
    end

    if @service_request.save
      flash.now[:sucess] = "Status updated successfully"
      redirect_to user_service_request_path(@service_request.user_id, @service_request)
    else
      flash.now[:danger] = "Status was not updated"
      redirect_to user_service_request_path(@service_request.user_id, @service_request)
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_request
      @service_request = ServiceRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_request_params
      params.require(:service_request).permit(:additional_notes, :user_id, :status, {image: []})
    end

    def service_request_service
      params.require(:service_request).permit(:services)
    end
end
