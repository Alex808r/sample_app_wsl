require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  #  Первый интеграционный тест. Функции:
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
  end
end
