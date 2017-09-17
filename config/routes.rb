Rails.application.routes.draw do

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'quote#random'
  
  get '/favorites/', to: 'quote#favorites', as: 'favorites'
  get '/like/:id', to: 'favorite#like', as: 'like_quote'
  get '/dislike/:id', to: 'favorite#dislike', as: 'dislike_quote'
end
