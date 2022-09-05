Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  scope "/sistemas" do
    #Manejo controller Personas
    resources :personas
    #patch 'personas/update'
    get 'personas/show/:id' => "personas#show", as: 'ver_perfil'
    get 'inactivar/:id' => "personas#inactivar_persona", as: 'inactivar_persona'
  end

  scope "/iconos" do
    #Manejo de controller font_awesome
    resources :font_awesomes
    get 'font_awesome/inactivar/:id' => "font_awesomes#inactivar_font_awesome", as: 'inactivar_font_awesome'
  end

  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
