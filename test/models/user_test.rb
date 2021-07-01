require "test_helper"

class UserTest < ActiveSupport::TestCase
  #создает модель перед запуском тестов
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
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

end
