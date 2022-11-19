class MenusController < ApplicationController
  before_action :set_menu, only: %i[ show edit update destroy ]

  # GET /menus or /menus.json
  def index
    @menus = Menu.order(id: 'DESC')
  end

  # GET /menus/1 or /menus/1.json
  def show
  end

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus or /menus.json
  def create
    @menu = Menu.new(menu_params)
    @menu.estado = "A"
    @menu.user_created_id = current_user.id

    respond_to do |format|
      if @menu.save
        format.html { redirect_to menus_url(@menu), notice: "El Menu #{@menu.nombre.upcase} se ha creado correctamente." }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al crear el menú, Verifique!!.." }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1 or /menus/1.json
  def update
    @menu.user_updated_id = current_user.id

    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to menus_url(@menu), notice: "El Menu #{@menu.nombre.upcase} se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: "Ocurrio un error al actualizar el menú, Verifique!!.." }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1 or /menus/1.json
  def destroy
    @menu.destroy

    respond_to do |format|
      format.html { redirect_to menus_url, notice: "El Menu #{@menu.nombre.upcase} se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  def inactivar_menu
    @menu = Menu.find(params[:id])
    @menu.user_updated_id = current_user.id
    @menu.estado = "I"

    respond_to do |format|
      if @menu.save
        format.html { redirect_to menus_url, notice: "El Menú #{@menu.nombre.upcase} ha sido Inactivado" }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { redirect_to menus_url, alert: "Ocurrio un error al inactivar el menú, Verifique!!.." }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def activar_menu
    @menu = Menu.find(params[:id])
    @menu.user_updated_id = current_user.id
    @menu.estado = "A"

    respond_to do |format|
      if @menu.save
        format.html { redirect_to menus_url, notice: "El Menú #{@menu.nombre.upcase} ha sido Activado" }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { redirect_to menus_url, alert: "Ocurrio un error al activar el menú, Verifique!!.." }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def menu_params
      params.require(:menu).permit(:nombre, :font_awesome_id, :descripcion, :user_created_id, :user_updated_id, :estado)
    end
end
