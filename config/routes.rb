Rails.application.routes.draw do
  resources :cocktails, only: [:show, :index, :new, :create, :edit, :update] do
    resources :doses, only: [ :create ]
  end
  resources :doses, only: [ :destroy ]

  root "cocktails#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
