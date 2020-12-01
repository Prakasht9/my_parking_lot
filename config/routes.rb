Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'parking_spaces#index'
  get 'parking_spaces/free_parking_space', to: 'parking_spaces#free_parking_space'
  
  get 'parking_spaces/unpark_form', to: 'parking_spaces#unpark_form'
  put 'parking_spaces/unpark', to: 'parking_spaces#unpark'
  
  get 'parking_spaces/find_vehical_form', to: 'parking_spaces#find_vehical_form'
  get 'parking_spaces/find_vehical', to: 'parking_spaces#find_vehical'
  
  resources :parking_spaces do 
    collection do
      get :render_available_space_type
    end
  end

end
