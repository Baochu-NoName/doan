require "test_helper"

class EndusersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enduser = endusers(:one)
  end

  test "should get index" do
    get endusers_url
    assert_response :success
  end

  test "should get new" do
    get new_enduser_url
    assert_response :success
  end

  test "should create enduser" do
    assert_difference('Enduser.count') do
      post endusers_url, params: { enduser: { email: @enduser.email, name: @enduser.name, phone: @enduser.phone } }
    end

    assert_redirected_to enduser_url(Enduser.last)
  end

  test "should show enduser" do
    get enduser_url(@enduser)
    assert_response :success
  end

  test "should get edit" do
    get edit_enduser_url(@enduser)
    assert_response :success
  end

  test "should update enduser" do
    patch enduser_url(@enduser), params: { enduser: { email: @enduser.email, name: @enduser.name, phone: @enduser.phone } }
    assert_redirected_to enduser_url(@enduser)
  end

  test "should destroy enduser" do
    assert_difference('Enduser.count', -1) do
      delete enduser_url(@enduser)
    end

    assert_redirected_to endusers_url
  end
end
