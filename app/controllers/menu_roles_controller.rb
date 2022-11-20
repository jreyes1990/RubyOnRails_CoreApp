class MenuRolesController < ApplicationController
  before_action :set_menu_rol, only: %i[ show edit update destroy ]

  # GET /menu_roles or /menu_roles.json
  def index
    @menu_roles = MenuRol.order(id: 'DESC')
  end

  # GET /menu_roles/1 or /menu_roles/1.json
  def show
  end

  # GET /menu_roles/new
  def new
    @menu_rol = MenuRol.new
  end

  # GET /menu_roles/1/edit
  def edit
  end

  # POST /menu_roles or /menu_roles.json
  def create
    @menu_rol = MenuRol.new(menu_rol_params)
    @menu_rol.estado = "A"
    @menu_rol.user_created_id = current_user.id

    respond_to do |format|
      if @menu_rol.save
        format.html { redirect_to menu_roles_url(@menu_rol), notice: "El Menú-Rol #{@menu_rol.menu.nombre.upcase}-#{@menu_rol.rol.nombre.upcase} se ha creado correctamente." }
        format.json { render :show, status: :created, location: @menu_rol }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al crear el Menú-Rol, Verifique!!.." }
        format.json { render json: @menu_rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_roles/1 or /menu_roles/1.json
  def update
    @menu_rol.user_updated_id = current_user.id

    respond_to do |format|
      if @menu_rol.update(menu_rol_params)
        format.html { redirect_to menu_roles_url(@menu_rol), notice: "El Menú-Rol #{@menu_rol.menu.nombre.upcase}-#{@menu_rol.rol.nombre.upcase} se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @menu_rol }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: "Ocurrio un error al actualizar el Menú-Rol, Verifique!!.." }
        format.json { render json: @menu_rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_roles/1 or /menu_roles/1.json
  def destroy
    @menu_rol.destroy

    respond_to do |format|
      format.html { redirect_to menu_roles_url, notice: "El Menú-Rol #{@menu_rol.menu.nombre.upcase}-#{@menu_rol.rol.nombre.upcase} se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  def inactivar_menu_rol
    @menu_rol = MenuRol.find(params[:id])
    @menu_rol.user_updated_id = current_user.id
    @menu_rol.estado = "I"

    respond_to do |format|
      if @menu_rol.save
        format.html { redirect_to menu_roles_url, notice: "El Menú-Rol #{@menu_rol.menu.nombre.upcase}-#{@menu_rol.rol.nombre.upcase} ha sido Inactivado" }
        format.json { render :show, status: :created, location: @menu_rol }
      else
        format.html { redirect_to menu_roles_url, alert: "Ocurrio un error al inactivar el Menú-Rol, Verifique!!.." }
        format.json { render json: @menu_rol.errors, status: :unprocessable_entity }
      end
    end
  end

  def activar_menu_rol
    @menu_rol = MenuRol.find(params[:id])
    @menu_rol.user_updated_id = current_user.id
    @menu_rol.estado = "A"

    respond_to do |format|
      if @menu_rol.save
        format.html { redirect_to menu_roles_url, notice: "El Menú-Rol #{@menu_rol.menu.nombre.upcase}-#{@menu_rol.rol.nombre.upcase} ha sido Activado" }
        format.json { render :show, status: :created, location: @menu_rol }
      else
        format.html { redirect_to menu_roles_url, alert: "Ocurrio un error al activar el Menú-Rol, Verifique!!.." }
        format.json { render json: @menu_rol.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_rol
      @menu_rol = MenuRol.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def menu_rol_params
      params.require(:menu_rol).permit(:menu_padre, :descripcion, :user_created_id, :user_updated_id, :estado, :rol_id, :opcion_id)
    end
end
