require "test_helper"

class SevereAlertsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @severe_alert = severe_alerts(:one)
  end

  test "should get index" do
    get severe_alerts_url, as: :json
    assert_response :success
  end

  test "should create severe_alert" do
    assert_difference("SevereAlert.count") do
      post severe_alerts_url, params: { severe_alert: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show severe_alert" do
    get severe_alert_url(@severe_alert), as: :json
    assert_response :success
  end

  test "should update severe_alert" do
    patch severe_alert_url(@severe_alert), params: { severe_alert: {  } }, as: :json
    assert_response :success
  end

  test "should destroy severe_alert" do
    assert_difference("SevereAlert.count", -1) do
      delete severe_alert_url(@severe_alert), as: :json
    end

    assert_response :no_content
  end
end
