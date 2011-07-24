module ApplicationHelper
  # Return a ttitle on a per page basis.
  def title 
    base_title = "Ruby on Rails Tutorial Sample app"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
