Rails.application.routes.draw do
  get 'demo/index'
  get 'demo/hello'
  get 'demo/otherhello'
  get 'demo/lynda'
  root 'demo#index'

  # Default route
  # get ':controller(/:action/(:id))'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
