Rails.application.routes.draw do
  root 'demo#index'

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
  
  # Default route
  # get ':controller(/:action/(:id))'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
