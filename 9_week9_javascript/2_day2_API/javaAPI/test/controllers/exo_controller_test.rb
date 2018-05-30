require 'test_helper'

class ExoControllerTest < ActionDispatch::IntegrationTest
  test "should get maps" do
    get exo_maps_url
    assert_response :success
  end

  test "should get twitch" do
    get exo_twitch_url
    assert_response :success
  end

end
