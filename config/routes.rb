Rails.application.routes.draw do
  root :to => 'projects#index'

  resources :projects do
    resources :skills, :except => [:show, :index]
  end
end
