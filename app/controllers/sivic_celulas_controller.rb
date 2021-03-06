class SivicCelulasController < ApplicationController
  before_action :set_sivic_celula, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  #load_and_authorize_resource

  # GET /sivic_celulas
  # GET /sivic_celulas.json
  def index

    #find_by_name_or_all
    @sivic_celulas = SivicCelula.find_by_name_or_all(params[:q],current_user.sivic_pessoa.sivic_igreja_id).paginate(:page => params[:page], :per_page => 10)

    #@sivic_celulas = SivicCelula.where("sivic_igreja_id = ?",current_user.sivic_pessoa.sivic_igreja_id).paginate(:page => params[:page], :per_page => 10).order(:id)
    @sivic_celulasreport = SivicCelula.where("sivic_igreja_id = ?",current_user.sivic_pessoa.sivic_igreja_id)

    respond_to do |format|
      format.html
      format.pdf { render_civic_celula_list(@sivic_celulasreport) }
    end    
  end  


  def busca_celulas

    sivic_celula = SivicCelula.joins('INNER JOIN sivic_pessoas sp on sp.id = sivic_celulas.sivic_pessoa_id').where('nome_pessoa like ? AND user_bloqueio is null', "%#{params[:nome_pessoa]}%")

    sivic_celula_json = sivic_celula.map {|item| {:id => item.id, :nome_pessoa => item.sivic_pessoa.nome_pessoa, :NOME_Celula => item.NOME_Celula, :NUMR_Dia => item.NUMR_Dia}}
    render :json => sivic_celula_json
  end  


  # GET /sivic_celulas/1
  # GET /sivic_celulas/1.json
  def show

    @sivic_celula = SivicCelula.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf { render_civic_celula_mirror(@sivic_celula) }
    end  

  end

  # GET /sivic_celulas/new
  def new
    @sivic_celula = SivicCelula.new
    @sivic_celula.build_sivic_endereco
  end

  # GET /sivic_celulas/1/edit
  def edit
    @sivic_estado = SivicCelula.find(params[:id])
    @sivic_estado = @sivic_estado.sivic_endereco.sivic_cidade.sivic_estado.id

    @sivic_cidade = SivicCidade.find :all, :conditions => {:sivic_estado_id => @sivic_estado}

    @sivic_cidade_setada = SivicCelula.find(params[:id])
    @sivic_cidade_setada = @sivic_cidade_setada.sivic_endereco.sivic_cidade.id
        
  end

  # POST /sivic_celulas
  # POST /sivic_celulas.json
  def create
    @sivic_celula = SivicCelula.new(sivic_celula_params)

    respond_to do |format|
      if @sivic_celula.save
        format.html { redirect_to @sivic_celula, notice: 'Registro inserido com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sivic_celula }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_celula.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_celulas/1
  # PATCH/PUT /sivic_celulas/1.json
  def update
    respond_to do |format|
      if @sivic_celula.update(sivic_celula_params)
        format.html { redirect_to @sivic_celula, notice: 'Registro alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_celula.errors, status: :unprocessable_entity }
      end
    end
  end

  def bloquea

    @sivic_celula = SivicCelula.find_by_id(params[:id])
    @sivic_celula.update(:DATA_Bloqueio => Time.now, :user_bloqueio => "#{params[:user_bloqueio]}",  :DESC_Bloqueio => "#{params[:DESC_Bloqueio]}" )

  
    respond_to do |format|
      format.html { redirect_to sivic_celulas_url }
      format.json { head :no_content }
    end

  end 

  def desbloquea

    @sivic_celula = SivicCelula.find_by_id(params[:id])
    @sivic_celula.update(:DATA_Bloqueio => nil)

  
    respond_to do |format|
      format.html { redirect_to sivic_celulas_url }
      format.json { head :no_content }
    end

  end 

  # DELETE /sivic_celulas/1
  # DELETE /sivic_celulas/1.json
  def destroy
    @sivic_celula.destroy
    respond_to do |format|
      format.html { redirect_to sivic_celulas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_celula
      @sivic_celula = SivicCelula.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_celula_params
      params.require(:sivic_celula).permit(:sivic_pessoa_id, :NUMR_Dia, :DATA_Bloqueio, :desc_sexo, :FLAG_crianca, :FLAG_jovem, :FLAG_adulto, :user_inclusao, :user_bloqueio, :NOME_Celula, :DESC_Bloqueio, :flag_gerarelatorio, :sivic_igreja_id, sivic_endereco_attributes: [ :id, :DESC_Bairro, :DESC_Rua, :DESC_Complemento, :DESC_Pontoreferencia, :NUMR_Cep, :sivic_cidade_id])
    end

    def render_civic_celula_list(tasks)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'celulas_list.tlf')

      tasks.each do |task|
        report.list.add_row do |row|
          row.values lblId: task.id
          row.values lblNome: task.sivic_pessoa.nome_pessoa
          row.values lblNomeCelula: task.NOME_Celula
          row.values lblDia: task.NUMR_Dia
          row.values lblDataBloqueio: task.DATA_Bloqueio
        end
      end


      report.page.item(:data).value(Time.now.strftime("%d/%m/%Y"))
      report.page.item(:operador).value(current_user.sivic_pessoa.nome_pessoa)
      
      send_data report.generate, filename: 'index.pdf', 
                                 type: 'application/pdf', 
                                 disposition: ''
    end




    def render_civic_celula_mirror(tasks)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'celulas_espelho.tlf')

      report.start_new_page do |page|

        page.item(:operador).value(current_user.sivic_pessoa.nome_pessoa)
        page.item(:data).value(Time.now)
        page.item(:lblId).value(tasks.id)
        page.item(:lblNome).value(tasks.NOME_Celula)
        page.item(:lblLider).value(tasks.sivic_pessoa.nome_pessoa)
        page.item(:lblDiaDaSemana).value(tasks.NUMR_Dia)
        page.item(:lblDataBloqueio).value(tasks.DATA_Bloqueio)
        page.item(:lblBairro).value(tasks.sivic_endereco.DESC_Bairro)
        page.item(:lblRua).value(tasks.sivic_endereco.DESC_Rua)
        page.item(:lblComplemento).value(tasks.sivic_endereco.DESC_Complemento)
        page.item(:lblPontoDeReferencia).value(tasks.sivic_endereco.DESC_Pontoreferencia)
        page.item(:lblCEP).value(tasks.sivic_endereco.NUMR_Cep)
        page.item(:lblCidade).value(tasks.sivic_endereco.sivic_cidade.nome_cidade)
        page.item(:lblEstado).value(tasks.sivic_endereco.sivic_cidade.sivic_estado.nome_estado)

      
      end


      send_data report.generate, filename: 'celulas_espelho.pdf', 
                                 type: 'application/pdf', 
                                 disposition: ''
    end

end
