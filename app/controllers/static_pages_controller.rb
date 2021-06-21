class StaticPagesController < ApplicationController
  def home
    render html: "Hello, this is Ruby on Rails Tutorial"
  end

  def help
  end
end
