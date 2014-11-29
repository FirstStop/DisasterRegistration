Rails.application.routes.draw do

  get 'stream/registrations' => 'stream#registrations'
  resources :stream

  resources :service_providers do
    member do
      get 'add_person'
    end
  end

  get 'session/login'
  post 'session/login' => 'session#do_login'
  get 'session/logout'

  resources :people, only: [:show, :create, :update, :new]

  root :to => 'welcome#index'
  get 'checklist' => 'welcome#checklist'

end
