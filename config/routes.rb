Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  scope "/sistemas" do
    #Manejo de controlador Empresa
    resources :empresas
    get 'empresa/inactivar/:id' => "empresas#inactivar_empresa", as: 'inactivar_empresa'

    #Manejo de controlador Area
    resources :areas
    get 'area/inactivar/:id' => "areas#inactivar_area", as: 'inactivar_area'

    #Manejo de controlador Persona
    resources :personas
    patch 'personas/update'
    get 'personas/show/:id' => "personas#show", as: 'ver_perfil'
    get "personas/modal_cambio_contra/:persona_id" => "personas#modal_cambiar_contrasena", as: "modal_cambiar_contrasena"
    post "personas/registrar_cambio_contrasena"
    get 'personas/inactivar/:id' => "personas#inactivar_persona", as: 'inactivar_persona'
    #get 'personas/edit'

    #Manejo de controlador Atributo
    resources :atributos
    get 'atributo/inactivar/:id' => "atributos#inactivar_atributo", as: 'inactivar_atributo'

    #Manejo de controlador Componente
    resources :componentes
    get 'componente/inactivar/:id' => "componentes#inactivar_componente", as: 'inactivar_componente'

    #Manejo de controlador Menu
    resources :menus
    get 'menu/inactivar/:id' => "menus#inactivar_menu", as: 'inactivar_menu'

    #Manejo de controlador Opcion
    resources :opciones
    get 'opcion/inactivar/:id' => "opciones#inactivar_opcion", as: 'inactivar_opcion'

    #Manejo de controlador Rol
    resources :roles
    get 'rol/inactivar/:id' => "roles#inactivar_rol", as: 'inactivar_rol'

    #Manejo de controlador Menu-Rol
    resources :menu_roles
    get 'menu_rol/inactivar/:id' => "menu_roles#inactivar_menu_rol", as: 'inactivar_menu_rol'

    #Manejo de controlador Opcion_Ca
    resources :opcion_cas
    get 'opcion_ca/inactivar/:id' => "opcion_cas#inactivar_opcion_ca", as: 'inactivar_opcion_ca'
  end

  scope "/iconos" do
    #Manejo de controller font_awesome
    resources :font_awesomes
    get 'font_awesome/inactivar/:id' => "font_awesomes#inactivar_font_awesome", as: 'inactivar_font_awesome'
  end

  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
