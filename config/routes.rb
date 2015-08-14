Rails.application.routes.draw do
	root to: "static_pages#root"

	namespace :api, defaults: {format: :json} do
		resources :posts, except: [:new, :edit]
		resources :categories, only: :index
		resources :images
	end
	resources :users
	resource :session, only: [:create, :new, :destroy]
end
