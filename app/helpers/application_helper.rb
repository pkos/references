# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # Return a title on a per-page basis.
  def title
    base_title = "Reference Stacker"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    logo = image_tag("logo.png", :alt => "Reference Stacker App", :class => "round")
  end
  
  require "webrat"

  Webrat.configure do |config|
    config.mode = :rails
  end
  
end
