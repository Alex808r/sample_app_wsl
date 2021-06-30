require "test_helper"

#assert_select позволяет нам тестировать наличие определённого тэга HTML
# (их также называют “селекторами”, отсюда и assert_select)
# Этот код проверяет наличие тэга <title>, содержащего строку “Home | Ruby on Rails Tutorial Sample App”

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "should get home" do
    get root_path
    #проверить успешный get запрос или нет.
    assert_response :success
    #
    #assert_select "title", "Home | Ruby on Rails Tutorial Sample App"
    assert_select "title", "#{@base_title}"
    #
    assert_select "h1", "Welcome to the Sample App"
  end

  test "should get help" do
    get help_path
    assert_response :success
    #
    #assert_select "title", "Help | Ruby on Rails Tutorial Sample App"
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    #
    #assert_select "title", "About | Ruby on Rails Tutorial Sample App"
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    #
    assert_select "title", "Contact | #{@base_title}"

  end

end
