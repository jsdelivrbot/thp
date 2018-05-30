class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protect_from_forgery with: :exception

  def hello
    render html: "hello, world! You"
  end

end
