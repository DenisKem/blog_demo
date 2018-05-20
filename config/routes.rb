Rails.application.routes.draw do
  scope :api, defaults: {format: :json} do
    namespace :v1 do
      resources :posts, only: [:create] do
        post :rate, on: :member
      end
    end
  end
end
