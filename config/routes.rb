Rails.application.routes.draw do

  get 'static_pages/home'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#home'
  resources :courses do
    resources :quizzes
  end
  resources :users, only: [:show, :index, :edit, :update]
patch "quizzes/:course_id/quizzes", controller: 'quizzes', action: 'update'
end
