module ApplicationHelper

  #Для решения проблемы отсутствующего заголовка страницы (нет provide в представлении)
  # мы определим собственный хелпер с названием full_title.
  #Он будет возвращать базовый заголовок,
  #“Ruby on Rails Tutorial Sample App”, в случае если
  #заголовок страницы не определен,
  #и добавлять вертикальную черту перед заголовком страницы в противном случае
  #
  # Теперь, когда у нас есть хелпер, мы можем упростить наш шаблон, заменив
  # <title> <%= yield(:title) %> | Ruby on Rails Tutorial Sample App</title> на
  # <title> <%= full_title(yield(:title)) %></title>

  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
      #"#{page_title} | #{base_title}" - альтернативная запись
    end
  end

end
