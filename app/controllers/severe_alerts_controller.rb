class SevereAlertsController < ApplicationController
  before_action :set_severe_alert, only: %i[ show update destroy ]

  # GET /severe_alerts
  def index
    @severe_alerts = SevereAlert.all

    render json: @severe_alerts
  end

  # GET /severe_alerts/1
  def show
    location = params[:location]
    alerts = fetch_severe_alerts(location)
    render json: alerts  # Fixed this line to render alerts instead of @severe_alert
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
    
    def fetch_severe_alerts(location)
      base_url = "https://api.weather.gov/alerts/active"
      url = "#{base_url}?area=#{URI.encode(location)}"
      
      response = Excon.get(url)
      
      if response.status == 200
        JSON.parse(response.body)
      else
        { error: "Failed to fetch severe alerts" }
      end
    end
end
