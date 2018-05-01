module DefaultPageContent

  extend ActiveSupport::Concern #this allows us to include cool methods inside aptivesupportconcern module, like before filter

  included do 
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Poet's Dashboard | Test1"
    @seo_keywords = " Poet's Dashboard "
  end

end