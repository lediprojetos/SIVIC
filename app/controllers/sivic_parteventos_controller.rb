class SivicParteventosController < ApplicationController
  before_action :set_sivic_partevento, only: [:show, :edit, :update, :destroy, :naoParticipou]
  before_action :authenticate_user!
  #load_and_authorize_resource

  include ActionView::Helpers::NumberHelper

  # GET /sivic_parteventos
  # GET /sivic_parteventos.json
  def index
    #@sivic_parteventos = SivicPartevento.paginate(:page => params[:page], :per_page => 10)
    @sivic_parteventos = SivicPartevento.where('(flag_naoparticipou is null or flag_naoparticipou = false) and (sivic_igreja_id =?)', current_user.sivic_pessoa.sivic_igreja_id).paginate(:page => params[:page], :per_page => 10)
  end

  def participanteseventos
    #@sivic_eventos = SivicEvento.where("data_encerramento is null").paginate(:page => params[:page], :per_page => 10)
    @sivic_eventos = SivicEvento.find_by_name_or_all(params[:q],current_user.sivic_pessoa.sivic_igreja_id).paginate(:page => params[:page], :per_page => 10)

  end

  def participanteseventogeracao
    @sivic_eventos = SivicEvento.find_by_name_or_all(params[:q],current_user.sivic_pessoa.sivic_igreja_id).paginate(:page => params[:page], :per_page => 10)

  end
  
  def relparticipantesEventos

    if params[:tipo] == '1'
      @sivic_partevento = SivicPartevento.joins('INNER JOIN sivic_pessoas sp on sivic_pessoa_id = sp.id').where('sivic_evento_id = ' + params[:id] + 'and flag_passando = TRUE').order('sp.nome_pessoa')
    else
      @sivic_partevento = SivicPartevento.joins('INNER JOIN sivic_pessoas sp on sivic_pessoa_id = sp.id').where('sivic_evento_id = ' + params[:id] + 'and flag_passando = FALSE').order('sp.nome_pessoa')
    end

    respond_to do |format|
      format.html
      format.pdf { render_participantes_eventos_list(@sivic_partevento) }
    end

  end 

def BuscaArvore(id)
  sivic_dados = SivicPessoa.where('father_id = ?', id.to_s)

    if sivic_dados

      sivic_dados.each do |sivic_pessoas|
      
        @allperson += [sivic_pessoas.id]
        BuscaArvore(sivic_pessoas.id)

      end

    end

end

  def relparticipantesEventoGeracao

    if params[:tipo] == '1'
      @sivic_partevento = SivicPartevento.joins('INNER JOIN sivic_pessoas sp on sivic_pessoa_id = sp.id').where('sivic_evento_id = ' + params[:id] + 'and flag_passando = TRUE').order('sp.nome_pessoa')
    else
      @sivic_partevento = SivicPartevento.joins('INNER JOIN sivic_pessoas sp on sivic_pessoa_id = sp.id').where('sivic_evento_id = ' + params[:id] + 'and flag_passando = FALSE').order('sp.nome_pessoa')
    end

      count = 0
      @sivic_partevento.each do |pat|
  
         @sivic_partevento[count].sivic_pessoa.nome_discipulador = busca_lider_geracao(@sivic_partevento[count].sivic_pessoa.id).sivic_pessoa.nome_pessoa

         count = count + 1

      end

    @sivic_partevento.sort_by! {|u| u.sivic_pessoa.nome_discipulador}

    respond_to do |format|
      format.html
      format.pdf { render_relatorio_eventos_list(@sivic_partevento) }
    end
     
  end 

  # GET /sivic_parteventos/1
  # GET /sivic_parteventos/1.json
  def show
  end

  # GET /sivic_parteventos/new
  def new
    @sivic_partevento = SivicPartevento.new
    @sivic_partevento.build_sivic_movimentofinanceiro
    
  end

  # GET /sivic_parteventos/1/edit
  def edit
    
  end

  # Metodo para setar quando uma pessoa está escrita em um evento mas não participou
  def naoParticipou

    @sivic_partevento.update(:flag_naoparticipou => true)
    respond_to do |format|
      format.html { redirect_to sivic_parteventos_url }
      format.json { head :no_content }
    end
  end

  # POST /sivic_parteventos
  # POST /sivic_parteventos.json
  def create
   
    @valor_movimento =  sivic_partevento_params[:sivic_movimentofinanceiro_attributes][:VALR_movimento]
    @valor_restante = sivic_partevento_params[:sivic_movimentofinanceiro_attributes][:valr_restante]

    @valor_movimento = @valor_movimento.gsub('.', '')
    @valor_movimento = @valor_movimento.gsub(',', '.').to_f 

    @valor_restante = @valor_restante.gsub('.', '')
    @valor_restante = @valor_restante.gsub(',', '.').to_f 
    
    @sivic_partevento = SivicPartevento.new(sivic_partevento_params)

    @sivic_partevento.sivic_movimentofinanceiro.VALR_movimento = @valor_movimento 
    @sivic_partevento.sivic_movimentofinanceiro.valr_restante = @valor_restante

    respond_to do |format|
      if @sivic_partevento.save
        format.html { redirect_to @sivic_partevento, notice: 'Registro inserido com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sivic_partevento }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_partevento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_parteventos/1
  # PATCH/PUT /sivic_parteventos/1.json
  def update

    @valor_movimento =  sivic_partevento_params[:sivic_movimentofinanceiro_attributes][:VALR_movimento]
    @valor_restante = sivic_partevento_params[:sivic_movimentofinanceiro_attributes][:valr_restante]

    @valor_movimento = @valor_movimento.gsub('.', '')
    @valor_movimento = @valor_movimento.gsub(',', '.').to_f 

    @valor_restante = @valor_restante.gsub('.', '')
    @valor_restante = @valor_restante.gsub(',', '.').to_f 
    

   @sivic_partevento.desc_convidadopor = sivic_partevento_params[:desc_convidadopor]
   @sivic_partevento.sivic_pessoa_id = sivic_partevento_params[:sivic_pessoa_id]
   @sivic_partevento.sivic_evento_id = sivic_partevento_params[:sivic_evento_id]
   @sivic_partevento.flag_naoparticipou = sivic_partevento_params[:flag_naoparticipou]
   @sivic_partevento.flag_passando = sivic_partevento_params[:flag_passando]
   @sivic_partevento.sivic_igreja_id = sivic_partevento_params[:sivic_igreja_id]
   @sivic_partevento.pessoa_convidou = sivic_partevento_params[:pessoa_convidou]
   @sivic_partevento.sivic_movimentofinanceiro.id = sivic_partevento_params[:sivic_movimentofinanceiro_attributes][:id]
   @sivic_partevento.sivic_movimentofinanceiro.VALR_movimento = @valor_movimento
   @sivic_partevento.sivic_movimentofinanceiro.user_inclusao = sivic_partevento_params[:sivic_movimentofinanceiro_attributes][:user_inclusao]
   @sivic_partevento.sivic_movimentofinanceiro.FLAG_baixa = sivic_partevento_params[:sivic_movimentofinanceiro_attributes][:FLAG_baixa]
   @sivic_partevento.sivic_movimentofinanceiro.sivic_tipmovfinanceiro_id = sivic_partevento_params[:sivic_movimentofinanceiro_attributes][:sivic_tipmovfinanceiro_id]
   @sivic_partevento.sivic_movimentofinanceiro.sivic_evento_id = sivic_partevento_params[:sivic_movimentofinanceiro_attributes][:sivic_evento_id]
   @sivic_partevento.sivic_movimentofinanceiro.DATA_exclusao = sivic_partevento_params[:sivic_movimentofinanceiro_attributes][:DATA_exclusao]
   @sivic_partevento.sivic_movimentofinanceiro.user_exclusao = sivic_partevento_params[:sivic_movimentofinanceiro_attributes][:user_exclusao]
   @sivic_partevento.sivic_movimentofinanceiro.DESC_movimento = sivic_partevento_params[:sivic_movimentofinanceiro_attributes][:DESC_movimento]
   @sivic_partevento.sivic_movimentofinanceiro.valr_restante = @valor_restante


    respond_to do |format|
      if @sivic_partevento.save
        format.html { redirect_to @sivic_partevento, notice: 'Registro alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_partevento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_parteventos/1
  # DELETE /sivic_parteventos/1.json
  def destroy
    @sivic_partevento.destroy
    respond_to do |format|
      format.html { redirect_to sivic_parteventos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_partevento
      @sivic_partevento = SivicPartevento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_partevento_params
      params.require(:sivic_partevento).permit(:desc_convidadopor, :sivic_pessoa_id, :sivic_evento_id, :FLAG_naoparticipou, :flag_passando, :sivic_igreja_id, :pessoa_convidou, sivic_movimentofinanceiro_attributes: [ :id, :VALR_movimento, :user_inclusao, :FLAG_baixa, :sivic_tipmovfinanceiro_id, :sivic_evento_id, :DATA_exclusao, :user_exclusao, :DESC_movimento, :valr_restante ])
    end
  end    

  def render_participantes_eventos_list(tasks)
    report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'participantes_eventos.tlf')

    cont = 1

    tasks.each do |task|
      report.list.add_row do |row|
        row.values lblNome: task.sivic_pessoa.nome_pessoa rescue nil
        row.values lblLider: task.sivic_pessoa.father.nome_pessoa rescue nil
        row.values lblConvidadoPor: task.convidou.nome_pessoa rescue nil
        #row.values lblValorPago: number_to_currency(task.sivic_movimentofinanceiro.VALR_movimento, unit: "R$", separator: ",", delimiter: "") rescue nil
        #row.values lblValorRestante: number_to_currency(task.sivic_movimentofinanceiro.valr_restante, unit: "R$", separator: ",", delimiter: "") rescue nil
        row.values lblCont: cont

        cont += 1

      end

      report.page.item(:lblNomeIgreja).value(current_user.sivic_pessoa.sivic_igreja.NOME_igreja)
      report.page.item(:data).value(Time.now.strftime("%d/%m/%Y"))


      report.page.item(:operador).value(current_user.sivic_pessoa.nome_pessoa)
      report.page.item(:lblNomeEvento).value(task.sivic_evento.desc_evento)
      report.page.item(:lblDataEvento).value(task.sivic_evento.DATA_inicio.blank? ? '' : task.sivic_evento.DATA_inicio.strftime("%d/%m/%Y"))

      if params[:tipo] == '1'
        report.page.item(:lblTipoRelatorio).value('Passando')
      else
        report.page.item(:lblTipoRelatorio).value('Servindo')
      end


    end
        send_data report.generate, filename: 'index.pdf', 
                                   type: 'application/pdf', 
                                   disposition: ''
  end


 def render_relatorio_eventos_list(tasks)
    report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'participantes_eventos_lider.tlf')

    cont = 1

    valorTotalPago = 0

    x = tasks.length

    #debugger

    tasks.each do |task|
      report.list.add_row do |row|
        row.values lblNome: task.sivic_pessoa.nome_pessoa rescue nil
      
        row.values lblVlrPagoPart: number_to_currency(task.sivic_movimentofinanceiro.VALR_movimento, unit: "R$", separator: ",", delimiter: "") rescue nil
        row.values lblVlrResPart: number_to_currency(task.sivic_movimentofinanceiro.valr_restante, unit: "R$", separator: ",", delimiter: "") rescue nil

        row.values lblConvidadoPor: task.convidou.nome_pessoa rescue nil
        @convidou = busca_participante_convidou(task.sivic_evento_id,task.pessoa_convidou)

        row.values lblValorPago: number_to_currency(@convidou.first.sivic_movimentofinanceiro.VALR_movimento, unit: "R$", separator: ",", delimiter: "") rescue nil
        row.values lblValorRestante: number_to_currency(@convidou.first.sivic_movimentofinanceiro.valr_restante, unit: "R$", separator: ",", delimiter: "") rescue nil

        row.values lblLider: task.sivic_pessoa.nome_discipulador   rescue nil

        row.values lblCont: cont

        cont += 1

        valorTotalPago = valorTotalPago + task.sivic_movimentofinanceiro.VALR_movimento rescue nil
        
      end

      report.page.item(:lblNomeIgreja).value(current_user.sivic_pessoa.sivic_igreja.NOME_igreja)
      report.page.item(:data).value(Time.now.strftime("%d/%m/%Y"))


      report.page.item(:operador).value(current_user.sivic_pessoa.nome_pessoa)
      report.page.item(:lblNomeEvento).value(task.sivic_evento.desc_evento)
      report.page.item(:lblDataEvento).value(task.sivic_evento.DATA_inicio.blank? ? '' : task.sivic_evento.DATA_inicio.strftime("%d/%m/%Y"))

      if params[:tipo] == '1'
        report.page.item(:lblTipoRelatorio).value('Passando')
      else
        report.page.item(:lblTipoRelatorio).value('Servindo')
      end


    end
        send_data report.generate, filename: 'index.pdf', 
                                   type: 'application/pdf', 
                                   disposition: ''
  end


  def busca_participante_convidou(id_evento,id_pessoa)

      @sivic_partevento = SivicPartevento.where(sivic_evento_id: id_evento, sivic_pessoa_id: id_pessoa)
       return @sivic_partevento
  end


  def busca_lider_geracao(id_pessoa)

  loop do
  
      @sivic_pessoa = SivicPessoa.find(id_pessoa)    
    @sivic_discipulo = SivicDiscipulo.find_by sivic_pessoa_id: id_pessoa 

    if @sivic_discipulo
      if @sivic_discipulo.flag_discipulador?
          break 
        else
        id_pessoa = @sivic_discipulo.sivic_pessoa.father_id  
      end
    else
       id_pessoa = @sivic_pessoa.father_id  
   end
   end   


   return @sivic_discipulo

  end