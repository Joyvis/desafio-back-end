Rails.application.routes.draw do
  post '/import', to: 'transactions#import'
  resources :transactions, only: [:index]
end
