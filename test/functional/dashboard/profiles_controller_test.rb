require 'test_helper'

class Dashboard::ProfilesControllerTest < ActionController::TestCase
  def setup
    @user = create :user
    login_as @user
  end

  test "should show profile page" do
    get :show
    assert_response :success, @response.body
  end

  test "should update profile" do
    put :update, :profile => { :name => 'change' }, :format => :json
    assert_response :success, @response.body
    assert_equal 'change', @user.reload.profile.name
  end
end