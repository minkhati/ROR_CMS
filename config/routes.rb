Rails.application.routes.draw do
  
  
  root to: 'public#index'
  get 'show/:permalink', to: 'public#show', as: 'public_show'

  get 'admin', to: 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :admin_users, except: [:show] do
    member do
      get :delete
    end
  end
  
  # delete is not included in resources by default
  resources :subjects do
    member do
      get :delete
    end

    # collection do
    #   get :export
    # end

  end

  resources :sections do
    member do
      get :delete
    end
  end

  resources :pages do
    member do
      get :delete
    end
  end

  get 'demo/index'
  get 'demo/hello'
  get 'demo/otherhello'
  get 'demo/lynda'
  get 'demo/escape_output'
  
  # Default route
  # get ':controller(/:action/(:id))'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
