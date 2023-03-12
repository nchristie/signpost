# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :video_urls, only: %i[index show create update destroy] do
        collection do
          get :find_urls
        end
      end
    end
  end
end
