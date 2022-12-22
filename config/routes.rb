Rails.application.routes.draw do
  mount Tolk::Engine => '/tolk', :as => 'tolk'
  root to: 'urls#index'

  get '/:shortened_url', to: 'urls#show', as: :url
  get '/tolk/:locale', to: 'tolk/locale#show'

  resources :urls, only: %i[index create] do
    get :popular, on: :collection
  end
end
