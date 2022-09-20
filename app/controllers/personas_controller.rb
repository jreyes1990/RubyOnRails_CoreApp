class PersonasController < ApplicationController
  before_action :set_persona, only: [:show, :edit, :update, :destroy]

  def show
    @empresa = Empresa.joins("inner join areas on empresas.id = areas.empresa_id
                                inner join personas_areas on personas_areas.area_id = areas.id
                                inner join personas on personas_areas.persona_id = personas.id
                                WHERE
                                personas.id = #{@persona.id}
                                and areas.empresa_id = #{current_user_empresa_id}").first

    @areas = Area.joins(" inner join empresas on empresas.id = areas.empresa_id
                            inner join personas_areas on personas_areas.area_id = areas.id
                            inner join personas on personas_areas.persona_id = personas.id
                            WHERE
                            personas.id = #{@persona.id}
                            and areas.empresa_id = #{current_user_empresa_id}").all

    @nombresAreas = ""

    @areas.each do |a|

      if @areas.count == 1
        @nombresAreas = @nombresAreas + a.nombre
      elsif @nombresAreas == ""
        @nombresAreas = @nombresAreas + a.nombre + ','
      else
        @nombresAreas = @nombresAreas+ ', ' + a.nombre
      end
      @nombresAreas.sub!(',,', ',')

    end
  end

  def edit
  end

  #Proceso para actualizar una persona
  def update
    respond_to do |format|
      if @persona.update(persona_params)
        format.html { redirect_to @persona, notice: "La Persona #{@persona.nombre} #{@persona.apellido} se ha actualizado correctamente" }
        format.json { render :show, status: :ok, location: @persona }

      else
        format.html { render :edit }
        format.json { render json: @persona.errors, status: :unprocessable_entity }

      end
    end
  end

  def modal_cambiar_contrasena
    @persona_id = params[:persona_id]

    respond_to do |format|
      format.html
      format.js
    end
  end

  #Proceso para inactivar una persona
  def inactivar_persona
    @persona = Persona.find(params[:id])
    @persona.user_updated_id = current_user.id
    @persona.estado = "I"

    respond_to do |format|
      if @persona.save
        @usuario = User.find(@persona.user_id)
        @usuario.estado = "I"
        @usuario.user_updated_id = current_user.id

        if @usuario.save
          format.html { redirect_to usuarios_index_path, notice: "Persona y Usuario ha sido Inactivado" }
          format.json { render :show, status: :created, location: @persona }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @persona.errors, status: :unprocessable_entity }
        end

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_persona
    @persona = Persona.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def persona_params
    params.require(:persona).permit(:nombre, :apellido, :direccion, :telefono, :user_updated_id, :foto)
  end
end
