class ArrendatariosController < ApplicationController
  before_action :set_arrendatario, only: [:show, :update, :destroy]

  # GET /arrendatarios
  def index
    @arrendatarios = Arrendatario.all

    render json: @arrendatarios
  end

  # GET /arrendatarios/1
  def show
    render json: @arrendatario
  end

  # POST /arrendatarios
  def create
    @arrendatario = Arrendatario.new(arrendatario_params)

    if @arrendatario.save
      render json: @arrendatario, status: :created, location: @arrendatario
    else
      render json: @arrendatario.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /arrendatarios/1
  def update
    if @arrendatario.update(arrendatario_params)
      render json: @arrendatario
    else
      render json: @arrendatario.errors, status: :unprocessable_entity
    end
  end

  # DELETE /arrendatarios/1
  def destroy
    @arrendatario.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arrendatario
      @arrendatario = Arrendatario.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def arrendatario_params
      params.require(:arrendatario).permit(:name, :valor_arriendo, :valor_total, :fecha_id)
    end
end
