class StaticPagesController < ApplicationController
    include ApplicationHelper
  before_action :require_login, only: [:secret_page]

  def home
  end

  def secret_page
  end
end
