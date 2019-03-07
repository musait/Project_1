Rails.application.routes.draw do


  devise_scope :user do
    root to: "devise/sessions#new"
  end

  namespace :admin do
    resources :identification_numbers
  end

  namespace :admin do
    resources :users
  end

  namespace :admin do
    resources :formations
  end

  namespace :admin do
    resources :events
  end

  namespace :admin do
    resources :position_validations
  end

  resources :position_validations


  get '/formations', to: 'dashboards#formations'

  get 'admin/index', to: 'admin/dashboards#index'

  get 'admin/users', to:'admin/users#index'

  get 'admin/id', to:'admin/identification_numbers#index'

  get 'admin/formations', to:'admin/formations#index'

  get 'admin/upgrade', to: 'admin/position_validations#index'

  get 'admin/calendar', to: 'admin/events#index'

  post 'admin/identification_numbers/new', to: 'admin/identification_numbers#create'


  post 'admin/formations/new', to: 'admin/formations#create'

  post 'admin/users', to: 'admin/users#update'

  post 'users/edit', to: 'users/registrations#update'

  

  get 'admin/events/edit', to: 'admin/events#edit'

  get 'calendrier', to: 'dashboards#calendar'

  post 'admin/events/new', to: 'admin/events#create'

  post "/admin/events/:id" => "admin/events#update"

  post '/admin/position_validations/edit', to:'admin/position_validations#update'

  devise_for :users, controllers: {registrations: 'users/registrations',sessions: 'users/sessions'} do
    get 'users/sign_in' => 'sessions#new', :as => :new_user_session
    post 'users/sign_in' => 'sessions#create', :as => :user_session
    get 'users/edit' => 'registations#edit'
  end

end
