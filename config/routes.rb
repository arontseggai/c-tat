Rails.application.routes.draw do

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'quote#random'
  
  get '/favorites/', to: 'quote#favorites', as: 'favorites'
end
