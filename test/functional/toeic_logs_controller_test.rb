require 'test_helper'

class ToeicLogsControllerTest < ActionController::TestCase
  setup do
    @toeic_log = toeic_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:toeic_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create toeic_log" do
    assert_difference('ToeicLog.count') do
      post :create, toeic_log: { exam_date: @toeic_log.exam_date, l_score: @toeic_log.l_score, r_score: @toeic_log.r_score, total_score: @toeic_log.total_score, user_id: @toeic_log.user_id }
    end

    assert_redirected_to toeic_log_path(assigns(:toeic_log))
  end

  test "should show toeic_log" do
    get :show, id: @toeic_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @toeic_log
    assert_response :success
  end

  test "should update toeic_log" do
    put :update, id: @toeic_log, toeic_log: { exam_date: @toeic_log.exam_date, l_score: @toeic_log.l_score, r_score: @toeic_log.r_score, total_score: @toeic_log.total_score, user_id: @toeic_log.user_id }
    assert_redirected_to toeic_log_path(assigns(:toeic_log))
  end

  test "should destroy toeic_log" do
    assert_difference('ToeicLog.count', -1) do
      delete :destroy, id: @toeic_log
    end

    assert_redirected_to toeic_logs_path
  end
end
