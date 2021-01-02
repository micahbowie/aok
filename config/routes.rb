Rails.application.routes.draw do
  root 'application#index'
  # resources :acts
  resources :unique_identifiers, param: :unique_id
  
  scope :unique_identifiers, module: 'unique_identifiers', as: 'uid' do
    resources :acts
  end

  # resources :unique_identifiers, param: :unique_id

  # get '/acts/':id, to: 'unique_identifiers#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
