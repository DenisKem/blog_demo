Rails.application.routes.draw do
  scope :api, defaults: {format: :json} do
    namespace :v1 do
      resources :author_ips, only: [:index]
      resources :posts, only: [:create] do
        post :rate, on: :member
        get :top, on: :collection
      end
    end
  end
end
