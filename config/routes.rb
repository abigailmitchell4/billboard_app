Rails.application.routes.draw do
 
  get 'static_pages/home'
  root 'artists#index'

  get '/home', to: 'home#home'
  
  # Custom Routes To Add Songs To A Billboard
  get 'new_billboard_song/:id', to: 'billboards#new_song', as: 'new_billboard_song'
  post 'add_billboard_song/:id/:song_id', to: 'billboards#add_song', as: 'add_billboard_song'
  delete 'remove_billboard_song/:id/:song_id', to: 'billboards#remove_song', as: 'remove_billboard_song'
  
  resources :artists do
    resources :songs
  end

  resources :billboards do
    resources :songs
  end

  resources :artists do
    resources :billboards 
  end

end
