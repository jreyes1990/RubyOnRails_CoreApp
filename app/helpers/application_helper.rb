module ApplicationHelper

  # METODOS DE ACTIVACION EN SIDEBAR - INICIO
  def is_home_active
    if params[:controller] == "home"
      "nav-item active"
    else
      "nav-item"
    end
  end

  # METODOS DE ACTIVACION EN SIDEBAR - ICONOS
  def is_active_controller_icono_titulo
    @controladores = ["font_awesomes"]
    if @controladores.include? params[:controller]
      "nav-item active"
    else
      "nav-item"
    end
  end

  def is_active_controller_icono
    @controladores = ["font_awesomes"]
    if @controladores.include? params[:controller]
      "nav-link"
    else
      "nav-link collapsed"
    end
  end

  def is_active_option_controller_icono
    @controladores = ["font_awesomes"]
    if @controladores.include? params[:controller]
      "collapse show"
    else
      "collapse"
    end
  end

  # METODOS DE ACTIVACION EN SIDEBAR - SISTEMAS
  def is_active_controller_sistema_titulo
    @controladores = ["usuarios", "roles", "personas_areas", "menus", "opciones", "menu_roles", "atributos", "componentes", "opcion_cas", "persona_empresa_formularios", "empresas", "areas"]
    if @controladores.include? params[:controller]
      "nav-item active"
    else
      "nav-item"
    end
  end

  def is_active_controller_sistema
    @controladores = ["usuarios", "roles", "personas_areas", "menus", "opciones", "menu_roles", "atributos", "componentes", "opcion_cas", "persona_empresa_formularios", "empresas", "areas"]
    if @controladores.include? params[:controller]
      "nav-link"
    else
      "nav-link collapsed"
    end
  end

  def is_active_option_controller_sistema
    @controladores = ["usuarios", "roles", "personas_areas", "menus", "opciones", "menu_roles", "atributos", "componentes", "opcion_cas", "persona_empresa_formularios", "empresas", "areas"]
    if @controladores.include? params[:controller]
      "collapse show"
    else
      "collapse"
    end
  end

  def is_active_action(controller)
    if params[:controller] == controller
      "collapse-item active"
    else
      "collapse-item"
    end
  end

end
