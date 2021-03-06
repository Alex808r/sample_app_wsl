require "test_helper"

class UserTest < ActiveSupport::TestCase
  #создает модель перед запуском тестов
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  #тест валидации модели созданной в setup
  test "should be valid" do
    assert @user.valid?
  end

  #тест валидации имени
  test "name should be present" do
    @user.name = "    "
    assert_not @user.valid?
  end

  #тест валидации емайл
  test "email should be present" do
    @user.email = "   "
    assert_not @user.valid?
  end

  #тест валидации длины имени
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_USER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end


  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[foo@bar..com user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  #тест на уникальность емайла
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase # чувствительность к регистру
    @user.save
    assert_not duplicate_user.valid?
  end

  #тест на сохранение емайла в нижнем регистре
  test "email addresses should be saved as lowercase" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  #тест на проверку пустой пароль или нет
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  #тест на проверку длинны пароля минимум 6 символов
  # 
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5 #множественное пристваивание password и password_confirmation одновременно пристваивается значение а*5
    assert_not @user.valid?
  end


end
