Rails.application.routes.draw do
  root 'home#top'
  get 'home/about' => 'home#about'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
  	resources :relationships, only:[:create, :destroy]
  	get 'follows' => 'relationships#follow', as: 'follows'
  	get 'followers' => 'relationships#follower', as: 'followers'
  end
  resources :books do
  	resources :book_comments, only:[:create, :destroy]
  	resources :favorites, only: [:create]
  	delete 'favorites' => 'favorites#destroy'
  end
end