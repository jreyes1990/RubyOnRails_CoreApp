class FontAwesomesController < ApplicationController
  before_action :set_font_awesome, only: %i[ show edit update destroy ]

  # GET /font_awesomes or /font_awesomes.json
  def index
    @font_awesomes = FontAwesome.where(estado: :'A').order(id: :DESC)
  end

  # GET /font_awesomes/1 or /font_awesomes/1.json
  def show
  end

  # GET /font_awesomes/new
  def new
    @font_awesome = FontAwesome.new
  end

  # GET /font_awesomes/1/edit
  def edit
  end

  # POST /font_awesomes or /font_awesomes.json
  def create
    @font_awesome = FontAwesome.new(font_awesome_params)
    @font_awesome.estado = "A"
    @font_awesome.user_created_id = current_user.id

    respond_to do |format|
      if @font_awesome.save
        format.html { redirect_to font_awesomes_url(@font_awesome), notice: "El icono #{@font_awesome.icono} se ha creado correctamente." }
        format.json { render :show, status: :created, location: @font_awesome }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al crear el Icono, Verifique!!.." }
        format.json { render json: @font_awesome.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /font_awesomes/1 or /font_awesomes/1.json
  def update
    @font_awesome.user_updated_id = current_user.id

    respond_to do |format|
      if @font_awesome.update(font_awesome_params)
        format.html { redirect_to font_awesomes_url(@font_awesome), notice: "El icono #{@font_awesome.icono} se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @font_awesome }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: "Ocurrio un error al actualizar el Icono, Verifique!!.." }
        format.json { render json: @font_awesome.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /font_awesomes/1 or /font_awesomes/1.json
  def destroy
    @font_awesome.destroy

    respond_to do |format|
      format.html { redirect_to font_awesomes_url, notice: "El icono #{@font_awesome.icono} se ha aliminado correctamente." }
      format.json { head :no_content }
    end
  end

  # Inactivar Icono Font-Awesome
  def inactivar_font_awesome
    @font_awesome = FontAwesome.find(params[:id])
    @font_awesome.user_updated_id = current_user.id
    @font_awesome.estado = "I"

    respond_to do |format|
      if @font_awesome.save
        format.html { redirect_to font_awesomes_url, notice: "El icono #{@font_awesome.icono} ha sido Inactivado" }
        format.json { render :show, status: :created, location: @font_awesome }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al inactivar el icono, Verifique!!.." }
        format.json { render json: @font_awesome.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_font_awesome
      @font_awesome = FontAwesome.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def font_awesome_params
      params.require(:font_awesome).permit(:prefijo_nombre, :icono, :termino, :codigo_css, :tipo_icono, :user_created_id, :user_updated_id, :estado)
    end
end
