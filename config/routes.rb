Rails.application.routes.draw do
	root to: "static_pages#root"

	namespace :api, defaults: {format: :json} do
		resources :posts, except: [:new, :edit]
		resources :categories, only: :index
		resources :images, except: [:new, :edit]
		resources :comments, except: [:new, :edit]
	end
	resources :users
	resource :session, only: [:create, :new, :destroy]
end
