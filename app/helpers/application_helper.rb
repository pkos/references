# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # Return a title on a per-page basis.
  def title
    base_title = "Reference Stacker"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{h(@title)}"
    end
  end
  
  def logo
    logo = image_tag("logo.png", :alt => "Reference Stacker App", :class => "round")
  end
 
  def bioruby
    bioruby = image_tag("bioruby-gem.png", :alt => "BioRuby", :class => "round")
  end 
  
  def rails
    rails = image_tag("rails.png", :alt => "Ruby on Rails", :class => "round")
  end
  
  def github
    rails = image_tag("github.png", :alt => "GitHub", :class => "round")
  end
  
  def pubmed
    rails = image_tag("pubmed.jpg", :alt => "PubMed", :class => "round")
  end
  
  require "webrat"

  Webrat.configure do |config|
    config.mode = :rails
  end
  
end
