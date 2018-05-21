Rails.application.routes.draw do
  scope :api, defaults: {format: :json} do
    namespace :v1 do
      resources :posts, only: [:create] do
        post :rate, on: :member
        collection do
          get :top
          get :popular_author_ips
        end
      end
    end
  end
end
