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

  # 有効なアドレスの有効性のテストデーション
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      # 第2引数にエラー文でどのアドレスでテストが成功しなかったかを特定する
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  # 無効なアドレスの無効性のテスト
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                                      foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
end
