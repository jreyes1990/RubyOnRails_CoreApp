Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  scope "/sistemas" do
    #Manejo de controlador Empresa
    resources :empresas
    get 'empresa/inactivar/:id' => "empresas#inactivar_empresa", as: 'inactivar_empresa'
    get 'empresa/activar/:id' => "empresas#activar_empresa", as: 'activar_empresa'

    #Manejo de controlador Area
    resources :areas
    get 'area/inactivar/:id' => "areas#inactivar_area", as: 'inactivar_area'
    get 'area/activar/:id' => "areas#activar_area", as: 'activar_area'

    #Manejo de controlador Persona
    resources :personas
    patch 'personas/update'
    get 'personas/show/:id' => "personas#show", as: 'ver_perfil'
    get "personas/modal_cambio_contra/:persona_id" => "personas#modal_cambiar_contrasena", as: "modal_cambiar_contrasena"
    post "personas/registrar_cambio_contrasena"
    get 'personas/inactivar/:id' => "personas#inactivar_persona", as: 'inactivar_persona'
    get 'personas/activar/:id' => "personas#activar_persona", as: 'activar_persona'

    post 'home/registrar_parametro'
    post "home/registrar_area_temporal"
    #get 'personas/edit'

    #Manejo controller Usuarios
    post 'usuarios/crear_usuario'
    get 'usuarios/index'
    get 'usuarios/agregar_usuario'
    get "/empresas/search" => "usuarios#search_empresa", as: "search_empresa"
    get "/areas/search" => "usuarios#search_areas", as: "search_areas"
    
    #Manejo de controlador Atributo
    resources :atributos
    get 'atributo/inactivar/:id' => "atributos#inactivar_atributo", as: 'inactivar_atributo'
    get 'atributo/activar/:id' => "atributos#activar_atributo", as: 'activar_atributo'

    #Manejo de controlador Componente
    resources :componentes
    get 'componente/inactivar/:id' => "componentes#inactivar_componente", as: 'inactivar_componente'
    get 'componente/activar/:id' => "componentes#activar_componente", as: 'activar_componente'

    #Manejo de controlador Menu
    resources :menus
    get 'menu/inactivar/:id' => "menus#inactivar_menu", as: 'inactivar_menu'
    get 'menu/activar/:id' => "menus#activar_menu", as: 'activar_menu'

    #Manejo de controlador Opcion
    resources :opciones
    get 'opcion/inactivar/:id' => "opciones#inactivar_opcion", as: 'inactivar_opcion'
    get 'opcion/activar/:id' => "opciones#activar_opcion", as: 'activar_opcion'

    #Manejo de controlador Rol
    resources :roles
    get 'rol/inactivar/:id' => "roles#inactivar_rol", as: 'inactivar_rol'
    get 'rol/activar/:id' => "roles#activar_rol", as: 'activar_rol'

    #Manejo de controlador Menu-Rol
    resources :menu_roles
    get 'menu_rol/inactivar/:id' => "menu_roles#inactivar_menu_rol", as: 'inactivar_menu_rol'
    get 'menu_rol/activar/:id' => "menu_roles#activar_menu_rol", as: 'activar_menu_rol'

    #Manejo de controlador Opcion_Ca
    resources :opcion_cas
    get 'opcion_ca/inactivar/:id' => "opcion_cas#inactivar_opcion_ca", as: 'inactivar_opcion_ca'
    get 'opcion_ca/activar/:id' => "opcion_cas#activar_opcion_ca", as: 'activar_opcion_ca'

    #Manejo controller Usuarios
    post 'usuarios/crear_usuario'
    get 'usuarios/index'
    get 'usuarios/agregar_usuario'

    #manejo de controller peresonas - areas 
    resources :personas_areas
    get 'usuario_area/inactivar/:id' => "personas_areas#inactivar_usuario_area", as: 'inactivar_usuario_area'
    get "personas_areas/search_areas_by_empresa"

    resources :persona_empresa_formularios
    get "permisos/" => "persona_empresa_formularios#index_permisos", :as => "permisos"
    post "persona_empresa_formularios/consulta_permisos"
    get "/permisos/search" => "persona_empresa_formularios#search_usuario", as: "search_usuarios"
    get "/permisos/show" => "persona_empresa_formularios#mostrar_permisos", as: "mostrar_permisos"
    get "/permisos/add" => "persona_empresa_formularios#agregar_permiso", as: "agregar_permisos"
    get "/permisos/showadd" => "persona_empresa_formularios#mostrar_agregar_permisos", as: "mostrar_agregar_permisos"
    post "persona_empresa_formularios/guardar_permisos"
    get "/permisos/opc_perfil" => "persona_empresa_formularios#obtener_opciones_por_perfil", as: "obtener_opciones_por_perfil"
    get "/permisos/opc_individual" => "persona_empresa_formularios#obtener_opciones_por_individual", as: "obtener_opciones_por_individual"
    delete "/permisos/remove/:id" => "persona_empresa_formularios#eliminar_permiso", as: "eliminar_permiso"

    #Para buscar las areas por empresa por persona de un usuario
    get '/permisos/searchemp/' => "persona_empresa_formularios#search_areas_persona", as: 'searchemp'  
  end

  scope "/iconos" do
    #Manejo de controller font_awesome
    resources :font_awesomes
    get 'font_awesome/inactivar/:id' => "font_awesomes#inactivar_font_awesome", as: 'inactivar_font_awesome'
  end

  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
