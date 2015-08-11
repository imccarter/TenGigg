Rails.application.routes.draw do
	root to: "static_pages#root"

	namespace :api, default: :json do
		resources :posts
	end
	resources :users
	resource :session, only: [:create, :new, :destroy]
end
