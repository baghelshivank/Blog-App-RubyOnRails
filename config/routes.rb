Rails.application.routes.draw do
  # get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  ## Defines the root path route ("/") :-
  # root "articles#home"
  root to: 'home#home'

  # get "articles", to: "articles#index"
  # post "articles", to: "articles#create"
  # get "/articles/new", to: "articles#new"
  # get "articles/:id", to: "articles#show"
  # get "/articles/:id/edit", to: "articles#edit"
  # patch "/articles/:id", to: "articles#update"
  # delete "/articles/:id", to: "articles#destroy"

  
  ## A route maps a request to a controller action. 
  ## The root route above declares that GET /articles requests are mapped to the index action of ArticlesController (controller file).
  ## Rails uses snake_case for controller names here, if you have a multiple word controller like MonsterTrucksController, you want to use monster_trucks#show for example.

  resources :articles do
    resources :comments
  end

  resources :registrations, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  delete 'sign_out', to: 'sessions#destroy'

  get "up" => "rails/health#show", as: :rails_health_check

end




