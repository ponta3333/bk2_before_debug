Rails.application.routes.draw do
  root 'home#top'
  get 'home/about' => 'home#about'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
  	resources :book_comments, only:[:create, :destroy]
  	resources :favorites, only: [:create]
  	delete 'favorites' => 'favorites#destroy'
  end
end