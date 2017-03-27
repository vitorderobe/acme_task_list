Rails.application.routes.draw do
  root :to =>'home#index'
  devise_for :users

  post 'lists/create' => 'lists#create'
  post 'tasks/create' => 'tasks#create'
end
