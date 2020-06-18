Rails.application.routes.draw do

  resources :tags
  resources :experts
  root to: 'static_pages#home'

  get '/:id' => "shortener/shortened_urls#show"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
