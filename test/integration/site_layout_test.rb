require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # Первый интеграционный тест глава 5. Функции:
  # Посетить корневой путь (Home-страница)
  # Убедиться, что обрабатывается правильный шаблон страницы
  # Проверить корректность ссылок на страницы Home, Help, About и Contact

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", signup_path # проверяем проход по кнопке регистрации
  end

  # добавьте код для посещения страницы регистрации с помощью
  # метода get и убедитесь, что заголовок полученной страницы является верным

  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "title signup page" do
    get signup_path
      #assert_select "title", "Sign up | #{@base_title}"
      # или так с использованием хелпера full_title("Sign up")
    assert_select "title", full_title("Sign up")
  end

end
