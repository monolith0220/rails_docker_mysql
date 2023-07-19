require "test_helper"

class UserTest < ActiveSupport::TestCase

  # setupは各テストが走る直前に実行される
  def setup
    # @userはインスタンス変数
    @user = User.new(name: "Lionel Messhi", email: "messhi@fifa.com")
  end

  test "should be valid" do
    assert @user.valid?
  end
end
