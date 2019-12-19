module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    # where you set instance variables with page default info (e.g., page title, seo keywords)
    # instance variables can be set to different values in controllers
    @page_title = "LinkUp | Connect With Your Crowd"
  end
end