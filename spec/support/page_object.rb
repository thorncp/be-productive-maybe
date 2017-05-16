class PageObject
  include FactoryGirl::Syntax::Methods
  include Capybara::DSL
  include Rails.application.routes.url_helpers
end
