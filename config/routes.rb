Rails.application.routes.draw do
  root :to =>'home#index'
  devise_for :users

  get 'home/my_lists'  => 'home#my_lists'
  get 'home/users'     => 'home#users'
  get 'home/favorites' => 'home#favorites'

  get  'lists/index'  => 'lists#index'
  get  'lists/show'   => 'lists#show'
  post 'lists/create' => 'lists#create'

  post 'tasks/create' => 'tasks#create'

  post   'favorites/create' => 'favorites#create'
  delete 'favorites/destroy' => 'favorites#destroy'
end
