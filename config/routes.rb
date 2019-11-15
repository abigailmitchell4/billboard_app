Rails.application.routes.draw do
 
  get 'billboards/index'
  get 'billboards/show'
  get 'billboards/new'
  get 'billboards/edit'
  root 'artists#index'
  
  resources :artists do
    resources :songs
  end

  resources :billboards do
    resources :songs
  end

end
