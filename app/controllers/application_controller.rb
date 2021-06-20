class ApplicationController < ActionController::Base

  def hello
    render html: "Hello, this is Ruby on Rails Tutorial"
  end

end
