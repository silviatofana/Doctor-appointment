require 'test_helper'

class Api::V1::DoctorsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get api_v1_doctors_index_url
    assert_response :success
  end
end
