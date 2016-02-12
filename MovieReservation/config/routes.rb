Rails.application.routes.draw do
  get 'sessions/new'

  resources :movies
  resources :users
  resources :reservations
  resources :screenings, except: [ :new]
  resources :rooms
  resources :seats
  get 'screenings/seats/:screening_id' => 'seats#show_screening_seats' , as: :screenings_seats
  get 'reservar/seats/:id&:screening_id' => 'seats#reservar_asiento' , as: :reservar_asiento
  get 'eliminar_reserva/seats/:id&:screening_id' => 'seats#eliminar_reserva' , as: :eliminar_reserva
  get ':movie_name/screenings/:movie_id' => 'screenings#show_movies_screenings' , as: :movies_screenings
  get ':movie_name/:movie_id/screenings/new' => 'screenings#new' , as: :new_screening
  #post ':movie_name/:movie_id/screenings/new' => 'screenings#create' , as: :create_movie_screenings

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get '/login' => 'sessions#new', as: :login
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy', as: :logout
  # You can have the root of your site routed with "root"
  root 'movies#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
