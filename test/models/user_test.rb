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

  # nameが51文字以上はfalse
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  # emailが256文字以上はfalse
  test "email should not be too long" do
    @user.name = "a" * 247 + "@fifa.com"
    assert_not @user.valid?
  end
end
