class HomeController < ApplicationController
  def index 
  end

  def create
      SendTweet.new(params)
      flash[:info]="It was tweeted"
      redirect_to root_path
  end
end
