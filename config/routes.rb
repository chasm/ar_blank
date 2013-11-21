ArBlank::Application.routes.draw do
  
  scope :api do
    resources :users, except: [ :show, :new, :edit ],
      defaults: { format: :json } do
       get ':id' => 'users#index', on: :collection 
    end
  end
  
  root 'users#index'
end
