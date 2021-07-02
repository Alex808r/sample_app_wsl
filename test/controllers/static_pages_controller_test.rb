require "test_helper"

  # assert_select позволяет нам тестировать наличие определённого тега HTML
  # их также называют "селекторами", отсюда и "assert_select"
  # Тест "should get home": протестируем страницу Home, выдав запрос GET к действию home, и затем убедившись,
  # что в ответ мы получаем код состояния ‘success (успех)’.”

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  # перед выполнением теста переменной "@base_title" пристваивается значение
  # setup, автоматически запускается перед каждым тестом
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "should get home" do
    # пройти по корневому пути (root_path) и проверить успешный get запрос или нет
    get root_path
    assert_response :success

    # Этот код проверяет наличие тега <title>, содержащего строку "Ruby on Rails Tutorial Sample App".
    # Можно записать 2 способами: с использованием переменной "@base_title" и без нее
    # assert_select "title", "Ruby on Rails Tutorial Sample App"
    # Хелпер заголовка для страницы "home" не используется, для других статических страниц используется
    assert_select "title", "#{@base_title}"
    #
    assert_select "h1", "Welcome to the Sample App"
  end

  test "should get help" do
    # пройти по help пути и проверить успешный get запрос или нет
    get help_path
    assert_response :success

    #assert_select "title", "Help | Ruby on Rails Tutorial Sample App"
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success

    #assert_select "title", "About | Ruby on Rails Tutorial Sample App"
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    get contact_path
    assert_response :success

    #assert_select "title", "Contact | Ruby on Rails Tutorial Sample App"
    assert_select "title", "Contact | #{@base_title}"
  end

end
