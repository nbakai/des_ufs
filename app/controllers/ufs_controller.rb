class UfsController < ApplicationController
  before_action :set_uf, only: [ :update, :destroy]
  @@contador = 0
  # GET /ufs
  def index
    @ufs = Uf.all
    render json: @ufs
  end
  
  # GET /ufs/1
  def show
    
    @uf = Uf.find_by(fecha: params[:fecha])
    if @uf.nil?
          render json: {message: 'No se encuentra el valor UF para esta fecha. Escriba formato yyyy-mm-dd'}
    else  
      Uf.increment_counter(:visitas, @uf.id)
      @valor = 0
      @valor = @uf[:valor]
      @visitas = @uf[:visitas]
      @@contador += 1
      render json: {Valor_uf: @valor, visitas_a_esta_fecha: @visitas, contador_de_visitas_totales: @@contador }
      
    end  
    @@contador
  end
  
  # POST /ufs
  def create
    @uf = Uf.new(uf_params)

    if @uf.save
      render json: @uf, status: :created, location: @uf
    else
      render json: @uf.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ufs/1
  def update
    if @uf.update(uf_params)
      render json: @uf
    else
      render json: @uf.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ufs/1
  def destroy
    @uf.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uf
      @uf = Uf.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def uf_params
      params.require(:uf).permit(:valor, :fecha, :visitas)
    end

end
