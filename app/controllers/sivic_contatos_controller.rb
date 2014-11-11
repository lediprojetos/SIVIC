class SivicContatosController < ApplicationController
  before_action :set_sivic_contato, only: [:show, :edit, :update, :destroy]

  # GET /sivic_contatos
  # GET /sivic_contatos.json
  def index
    @sivic_contatos = SivicContato.all
  end

  def envia_contato

    @sivic_contato = SivicContato.new
    @sivic_contato.desc_nome = params[:desc_nome]
    @sivic_contato.desc_email = params[:desc_email]
    @sivic_contato.desc_assunto = params[:desc_assunto]
    @sivic_contato.desc_mensagem = params[:desc_mensagem]
    @sivic_contato.desc_ip = request.remote_ip
    @sivic_contato.save

      sivic_contato = SivicContato.find :all, :conditions => {:id => @sivic_contato.id}
      sivic_contato_json = sivic_contato.map {|item| {:id => item.id}}
      render :json => sivic_contato_json      

  end

  # GET /sivic_contatos/1
  # GET /sivic_contatos/1.json
  def show
  end

  # GET /sivic_contatos/new
  def new
    @sivic_contato = SivicContato.new
  end

  # GET /sivic_contatos/1/edit
  def edit
  end

  # POST /sivic_contatos
  # POST /sivic_contatos.json
  def create
    @sivic_contato = SivicContato.new(sivic_contato_params)

    respond_to do |format|
      if @sivic_contato.save
        format.html { redirect_to contact_path, notice: 'Mensagem enviada com sucesso. Em breve entraremos em contato. OBrigado!' }
        format.json { render action: 'show', status: :created, location: @sivic_contato }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_contato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_contatos/1
  # PATCH/PUT /sivic_contatos/1.json
  def update
    respond_to do |format|
      if @sivic_contato.update(sivic_contato_params)
        format.html { redirect_to @sivic_contato, notice: 'Sivic contato was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_contato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_contatos/1
  # DELETE /sivic_contatos/1.json
  def destroy
    @sivic_contato.destroy
    respond_to do |format|
      format.html { redirect_to sivic_contatos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_contato
      @sivic_contato = SivicContato.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_contato_params
      params.require(:sivic_contato).permit(:desc_nome, :desc_email, :desc_assunto, :desc_mensagem, :desc_ip)
    end
end
