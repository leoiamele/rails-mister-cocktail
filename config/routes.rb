Rails.application.routes.draw do

resources :cocktails
root to: 'cocktails#index'
end
