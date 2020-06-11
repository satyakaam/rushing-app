Rails.application.routes.draw do
  resources :players, only: :index do
    get :download, on: :collection, defaults: { format: 'csv' }
  end
end
