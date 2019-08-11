Rails.application.routes.draw do
  root to: "urls#index"

  get "/:shortened_url", to: "urls#show", as: :url

  resources :urls, only: [:index, :create] do
    get :popular, on: :collection
  end
end
