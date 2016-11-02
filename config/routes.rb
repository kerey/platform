Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  
  get '/my-courses',   to: 'courses#my_courses'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users

  resources :users, only: [:show]
  resources :courses
  resources :lessons
  resources :homeworks
  resources :answers

end