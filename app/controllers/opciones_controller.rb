class OpcionesController < ApplicationController
  before_action :set_opcion, only: %i[ show edit update destroy ]

  # GET /opciones or /opciones.json
  def index
    @opciones = Opcion.where(estado: 'A').order(id: 'DESC')
  end

  # GET /opciones/1 or /opciones/1.json
  def show
  end

  # GET /opciones/new
  def new
    @opcion = Opcion.new
  end

  # GET /opciones/1/edit
  def edit
  end

  # POST /opciones or /opciones.json
  def create
    @opcion = Opcion.new(opcion_params)
    @opcion.estado = "A"
    @opcion.user_created_id = current_user.id

    respond_to do |format|
      if @opcion.save
        format.html { redirect_to opciones_url(@opcion), notice: "La Opción #{@opcion.nombre.upcase} se ha creado correctamente." }
        format.json { render :show, status: :created, location: @opcion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @opcion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opciones/1 or /opciones/1.json
  def update
    @opcion.user_updated_id = current_user.id

    respond_to do |format|
      if @opcion.update(opcion_params)
        format.html { redirect_to opciones_url(@opcion), notice: "La Opción #{@opcion.nombre.upcase} se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @opcion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @opcion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opciones/1 or /opciones/1.json
  def destroy
    @opcion.destroy

    respond_to do |format|
      format.html { redirect_to opciones_url, notice: "La Opción #{@opcion.nombre.upcase} se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  def inactivar_opcion
    @opcion = Opcion.find(params[:id])
    @opcion.user_updated_id = current_user.id
    @opcion.estado = "I"

    respond_to do |format|
      if @opcion.save
        format.html { redirect_to opciones_url, notice: "La Opción #{@opcion.nombre.upcase} ha sido Inactivado" }
        format.json { render :show, status: :created, location: @opcion }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al inactivar la opción, Verifique!!.." }
        format.json { render json: @opcion.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opcion
      @opcion = Opcion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def opcion_params
      params.require(:opcion).permit(:nombre, :font_awesome_id, :path, :descripcion, :controlador, :user_created_id, :user_updated_id, :estado, :menu_id)
    end
end
