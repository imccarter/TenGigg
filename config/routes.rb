Rails.application.routes.draw do
	root to: "static_pages#root"

	namespace :api, defaults: {format: :json} do
		resources :users, only: [:index, :show, :update]
		resources :posts, except: [:new, :edit] do
			get "user_posts", to: "posts#user_posts", on: :collection
			get "random", to: "posts#random", on: :collection
			get "all_posts", to: "posts#all_posts", on: :collection
		end
		resources :categories, only: :index
		resources :images, except: [:new, :edit]
		resources :comments, except: [:new, :edit]
		resources :votes, only: [:create, :destroy, :update]
	end

	resources :users, only: [:new, :create]
	resource :session, only: [:create, :new, :destroy]
end
