module ApplicationHelper

    # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Universal Questionning"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def require_login
    unless logged_in?
      flash[:warning] = "You must be logged in to access the unnverving answer to the uniserve question"
      redirect_to root_path
    end
  end


  
end