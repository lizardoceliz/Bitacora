Bitacora::Application.routes.draw do
  devise_for :users, :path => :account

  resources :log_entries do
    member do
      put :complete
      put :starred
    end
  end

  get "welcome/index"
  root :to => "welcome#index"
end

