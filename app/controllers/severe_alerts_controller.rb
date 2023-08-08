class SevereAlertsController < ApplicationController
  before_action :set_severe_alert, only: %i[ show update destroy ]

  # GET /severe_alerts
  def index
    @severe_alerts = SevereAlert.all

    render json: @severe_alerts
  end

  # GET /severe_alerts/1
  def show
    render json: @severe_alert
  end

  # POST /severe_alerts
  def create
    @severe_alert = SevereAlert.new(severe_alert_params)

    if @severe_alert.save
      render json: @severe_alert, status: :created, location: @severe_alert
    else
      render json: @severe_alert.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /severe_alerts/1
  def update
    if @severe_alert.update(severe_alert_params)
      render json: @severe_alert
    else
      render json: @severe_alert.errors, status: :unprocessable_entity
    end
  end

  # DELETE /severe_alerts/1
  def destroy
    @severe_alert.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_severe_alert
      @severe_alert = SevereAlert.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def severe_alert_params
      params.fetch(:severe_alert, {})
    end
end
