Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :courses
  get '/my-courses',   to: 'courses#my_courses'
  get '/add_students', to: 'courses#add_students'
  get '/register_student', to: 'courses#register_student'
  get '/unregister_student', to: 'courses#unregister_student'
  
  root 'static_pages#home'
  get 'sessions/new'
  get 'users/new'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
	get  '/signup',  to: 'users#new'

	get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'answers/changePoint'

	resources :users
  resources :lessons#, only: [:create, :destroy]
  resources :homeworks
  resources :answers
end