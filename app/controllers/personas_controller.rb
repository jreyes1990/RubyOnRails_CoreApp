class PersonasController < ApplicationController
  before_action :set_persona, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  #Metodo para actualizar una persona
  def update
    @persona.user_updated_id = current_user.id

    respond_to do |format|
      if @persona.update(persona_params)
        format.html { redirect_to @persona, notice: 'Persona modficada' }
        format.json { render :show, status: :ok, location: @persona }
      else
        format.html { render :edit }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  #Metodo para inactivar una persona
  def inactivar_persona
    @personas = Persona.find(params[:id])
    @personas.user_updated_id = current_user.id
    @personas.estado = "I"

    respond_to do |format|
      if @personas.save
        @usuario = User.find(@personas.user_id)

        @usuario.estado = "I"
        @usuario.user_updated_id = current_user.id
        if @usuario.save
          format.html { redirect_to usuarios_index_path, notice: "Persona y Usuario Inctivado" }
          format.json { render :show, status: :created, location: @personas }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @personas.errors, status: :unprocessable_entity }
        end

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personas.errors, status: :unprocessable_entity }
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

  def registrar_cambio_contrasena
    contrasena_nueva = params[:cambio_contrasena_form][:password_nueva]
    confirma_contrasena = params[:cambio_contrasena_form][:password_confirmada]
    @user = User.find(current_user.id)

    respond_to do |format|
      if contrasena_nueva == confirma_contrasena
        contrasena_nueva_encriptada = BCrypt::Password.create(contrasena_nueva)
        @user.encrypted_password = contrasena_nueva_encriptada

        if @user.save
          format.html { redirect_to persona_path(current_user.persona), notice: "La contraseña se ha actualizado correctamente." }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { redirect_to persona_path(current_user.persona), alert: "Ocurrio un error al actualizar la contraseña, Verifique!!.." }
          format.json { render :show, status: :created, location: @user }
        end
      else
        format.html { redirect_to persona_path(current_user.persona), alert: "Las nueva contraseña y confirmación no coinciden, intente de nuevo." }
        format.json { render :show, status: :created, location: @user }
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
    params.require(:persona).permit(:foto, :nombre, :apellido, :direccion, :telefono, :user_updated_id)
  end

end
