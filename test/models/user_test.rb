require "test_helper"

class UserTest < ActiveSupport::TestCase

  # setupは各テストが走る直前に実行される
  def setup
    # @userはインスタンス変数
    @user = User.new(name: "Lionel Messhi", email: "messhi@fifa.com", password: "football", password_confirmation: "football")
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

  # 重複するメールアドレス拒否のテスト
  test "email addresses should be unique" do
    # 同じ属性を持つオブジェクトを複製
    duplicate_user = @user.dup
    # 大文字に変換した値をセット
    duplicate_user.email = @user.email.upcase
    # データベースに保存
    @user.save
    assert_not duplicate_user.valid?
  end

  # メールアドレスを小文字化するテスト
  test "email addresses should be saved as lower-case" do
    # 大文字と小文字を混在した例
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  # パスワードに空白6個を代入 パスワードが存在しているかテスト
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  # パスワードに5文字を代入 パスワードの最小文字数をテスト
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end
