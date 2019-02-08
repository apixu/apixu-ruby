Rails.application.routes.draw do
  get 'weather/search', controller: 'weather', action: 'search'
end
