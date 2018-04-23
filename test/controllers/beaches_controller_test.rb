require 'test_helper'

class BeachesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get beaches_index_url
    assert_response :success
  end

end
