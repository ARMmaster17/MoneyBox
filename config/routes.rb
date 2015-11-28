Rails.application.routes.draw do
  root 'front#index'
  resources :investors
  resources :company
end
