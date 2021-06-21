require "test_helper"

#assert_select позволяет нам тестировать наличие определённого тэга HTML
# (их также называют “селекторами”, отсюда и assert_select)
# Этот код проверяет наличие тэга <title>, содержащего строку “Home | Ruby on Rails Tutorial Sample App”

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    #
    assert_select "title", "Home | Ruby on Rails Tutorial Sample App"

    #
    assert_select "h1", "Sample App"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    #
    assert_select "title", "Help | Ruby on Rails Tutorial Sample App"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    #
    assert_select "title", "About | Ruby on Rails Tutorial Sample App"
  end

end
