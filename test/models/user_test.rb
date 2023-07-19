require "test_helper"

class UserTest < ActiveSupport::TestCase

  # setupは各テストが走る直前に実行される
  def setup
    # @userはインスタンス変数
    @user = User.new(name: "Lionel Messhi", email: "messhi@fifa.com")
  end

  # userオブジェクトが有効かテスト
  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "    "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "    "
    assert_not @user.valid?
  end
end
