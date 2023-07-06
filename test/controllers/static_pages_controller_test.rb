require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  # 各テストが走る前に実行されるメソッド
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "should get root" do
    get root_url
    assert_response :success
  end

  test "should get home" do
    # GETリクエストをhomeアクションに対して発行
    get static_pages_home_url
    # リクエストに対するレスポンスは[成功]か
    assert_response :success
    # titleというタグが存在するか
    assert_select "title", "#{@base_title}"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end
end
