Rails.application.routes.draw do
  get 'index', to: "index#index"
  get 'cal', to: "wl_cals#index"
  resources :wl_cals;
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
