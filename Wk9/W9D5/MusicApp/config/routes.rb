Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :users, only:[:create, :new, :show]

    resources :bands, only:[:index, :create, :new, :edit, :show, :update, :destroy]

    resource :sessions, only: [:new, :create, :destroy]
end
