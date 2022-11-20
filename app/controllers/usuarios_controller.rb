class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  #before_action :comprobar_permiso

  def index
    @personas = Persona.order(:id)
  end

  def new    
  end

  def agregar_usuario
    @empresa = Empresa.where(:estado =>'A').limit(10)
  end

  def crear_usuario
  @usuario = User.new(usuario_params)    
  @usuario.user_created_id = current_user.id
  @usuario.estado = "A"

    begin  
      respond_to do |format|
        if @usuario.save
          @persona = Persona.where("user_id = ?", @usuario.id).first                                             
          if @persona.update(persona_params)
            area_id = params[:usuario_form][:area_id]
            @persona_areas = PersonasArea.new
            @persona_areas.persona_id = @persona.id
            @persona_areas.area_id = area_id
            @persona_areas.estado = 'A'
            @persona_areas.user_created_id = current_user.id
            
            if @persona_areas.save
              format.html { redirect_to usuarios_index_path, notice: 'Usuario creado exitosamente.' } 
            else 
              flash[:alert] = "No se pudo asignar la persona a una área"
              redirect_to usuarios_index_path  
            end                 
          else 
            flash[:alert] = "No se pudo crear la persona"
            redirect_to usuarios_index_path          
          end 
        else          
          flash[:alert] = "No se pudo crear el usuario"
          redirect_to usuarios_index_path
        end
      end
    rescue Exception => e
        puts "Error General: #{e.message}"
    end
  end

  def search_empresa
  parametro = params[:q].upcase
    
  @empresa =  Empresa.where("(upper(id|| ' ' ||  nombre ) like upper('%#{parametro}%'))
                              and estado = 'A' ").limit(50).distinct

    respond_to do |format|
      format.json { render json: @empresa.map { |p| { valor_id: p.id, valor_text: p.informacion_empresa } } }
    end   
  end 

  def search_areas
  parametro = params[:q].upcase
  empresa_id = params[:empresa_id]
      
  @empresa =  Area.joins("inner join empresas on areas.empresa_id = empresas.id
                          where areas.empresa_id = #{empresa_id}
                          and areas.estado = 'A'
                          and (upper(areas.id|| ' ' ||  areas.nombre || ' ' || empresas.nombre ) like upper('%#{parametro}%'))").limit(50).distinct

    respond_to do |format|
      format.json { render json: @empresa.map { |p| { valor_id: p.id, valor_text: p.nombre_area_empresa } } }
    end   
  end 

  def set_usuario   
  end 

  def usuario_params
    params.require(:usuario_form).permit(:email, :password )
  end
  
  def persona_params
    params.require(:usuario_form).permit(:nombre, :apellido, :telefono, :direccion, :user_created_id, :estado)
  end
end
