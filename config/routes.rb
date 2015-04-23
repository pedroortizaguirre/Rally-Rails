Rails.application.routes.draw do
root 'rally#index'
get 'rally/index'
get 'rally/show'
resources :rally
end
