Rails.application.routes.draw do
  resources :ufs
  get 'uf/:fecha', to: 'ufs#show' 
  get 'client/:nombre', to: 'arrendatarios#show'
  resources :arrendatarios, only: [:new]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
