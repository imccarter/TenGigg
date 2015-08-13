Rails.application.routes.draw do
	root to: "static_pages#root"

	namespace :api, default: :json do
		resources :posts, except: [:new, :edit]
		resources :categories, only: [:create, :index]
	end
	resources :users
	resource :session, only: [:create, :new, :destroy]
end
