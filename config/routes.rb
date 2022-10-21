Rails.application.routes.draw do
  resources :monsters, only: [:index, :new, :create, :update]

  #root "monsters#index"
  #root "monsters#_form"
  root "monsters#_editform"
end
