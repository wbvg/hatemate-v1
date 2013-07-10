Hatemate::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

root :to => 'hates#index'

# devise_scope :user do
#   get "sign_in", :to => "devise/sessions#new"
# end


  resources :users, :hates, :ratings, :about




end

