Rails.application.routes.draw do
  namespace :v1 do
    resources :pug_bombs, only: :create
  end
end
