Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  scope "/iconos" do
    #Manejo de controller font_awesome
    resources :font_awesomes
    get 'font_awesome/inactivar/:id' => "font_awesomes#inactivar_font_awesome", as: 'inactivar_font_awesome'
  end

  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
