ArBlank::Application.routes.draw do
  
  scope :api do
    resources :users, except: [ :show, :new, :edit ],
      defaults: { format: :json } do
      get ':id' => 'users#index', on: :collection 
       
      resources :posts, except: [ :show, :new, :edit ],
        defaults: { format: :json } do
        get ':id' => 'posts#index', on: :collection
      end
    end
  end
  
  root 'site#index'
end
