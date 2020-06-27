Rails.application.routes.draw do
	devise_for :users, :controllers => { registrations: 'registrations' }
	
	authenticated :user do
		root "homepage#all_jobs_list", as: :authenticated_root				
	end
	root 'homepage#index'
	
	namespace :api, defaults: { format: :json } do
		namespace :v1 do
			resources :jobs, only: [:index, :show, :create, :update]
		end
	end

	resources :jobs, only: [:index, :create, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
