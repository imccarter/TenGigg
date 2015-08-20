Rails.application.routes.draw do
	root to: "static_pages#root"

	namespace :api, defaults: {format: :json} do
		resources :users, only: [:index, :show, :update]
		resources :posts, except: [:new, :edit] do
			get "random", to: "posts#random", on: :collection
		end
		resources :categories, only: :index
		resources :images, except: [:new, :edit]
		resources :comments, except: [:new, :edit]
		resources :votes, only: [:create, :destroy, :update]
	end

	resources :users, only: [:new, :create]
	resource :session, only: [:create, :new, :destroy]
end
