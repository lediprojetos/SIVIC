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
    @sivic_eventos = SivicEvento.find_by_name_or_all(params[:q]).paginate(:page => params[:page], :per_page => 10)
  end

  def participanteseventogeracao
    @sivic_eventos = SivicEvento.find_by_name_or_all(params[:q]).paginate(:page => params[:page], :per_page => 10)

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

  def relparticipantesEventoGeracao
    if params[:tipo] == '1'
      @sivic_partevento = SivicPartevento.joins('INNER JOIN sivic_pessoas sp on sivic_pessoa_id = sp.id').where('sivic_evento_id = ' + params[:id] + 'and flag_passando = TRUE').order('sp.nome_pessoa')
    else
      @sivic_partevento = SivicPartevento.joins('INNER JOIN sivic_pessoas sp on sivic_pessoa_id = sp.id').where('sivic_evento_id = ' + params[:id] + 'and flag_passando = FALSE').order('sp.nome_pessoa')
    end

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

    @sivic_partevento = SivicPartevento.new(sivic_partevento_params)
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
    respond_to do |format|
      if @sivic_partevento.update(sivic_partevento_params)
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

    tasks.each do |task|
      report.list.add_row do |row|
        row.values lblNome: task.sivic_pessoa.nome_pessoa rescue nil
        row.values lblConvidadoPor: task.convidou.nome_pessoa rescue nil

        @convidou = busca_participante_convidou(task.sivic_evento_id,task.pessoa_convidou)

        row.values lblVlrPagoPart: number_to_currency(task.sivic_movimentofinanceiro.VALR_movimento, unit: "R$", separator: ",", delimiter: "") rescue nil
        row.values lblVlrResPart: number_to_currency(task.sivic_movimentofinanceiro.valr_restante, unit: "R$", separator: ",", delimiter: "") rescue nil

        row.values lblValorPago: number_to_currency(@convidou.first.sivic_movimentofinanceiro.VALR_movimento, unit: "R$", separator: ",", delimiter: "") rescue nil
        row.values lblValorRestante: number_to_currency(@convidou.first.sivic_movimentofinanceiro.valr_restante, unit: "R$", separator: ",", delimiter: "") rescue nil

        @lider_geracao = busca_lider_geracao(task.sivic_pessoa_id)

        row.values lblLider: @lider_geracao.sivic_pessoa.nome_pessoa rescue nil

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


 def render_relatorio_eventos_list1(tasks)
    report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'participantes_eventos_lider.tlf')

    cont = 1
    cont1 = 0
    contNum = 1
    @dados  =Array.new

    tasks.each do |task| 

          @convidou = busca_participante_convidou(task.sivic_evento_id,task.pessoa_convidou)
          @lider_geracao = busca_lider_geracao(task.sivic_pessoa_id)

          @desc_evento = task.sivic_evento.desc_evento
          @data_inicio = task.sivic_evento.DATA_inicio.blank? ? '' : task.sivic_evento.DATA_inicio.strftime("%d/%m/%Y")
         
          if @convidou.first
                  @convidadopor = @convidou.first.sivic_pessoa.nome_pessoa 
                  @valorPago = number_to_currency(@convidou.first.sivic_movimentofinanceiro.VALR_movimento, unit: "R$", separator: ",", delimiter: "")
                  @valorRestante = number_to_currency(@convidou.first.sivic_movimentofinanceiro.valr_restante, unit: "R$", separator: ",", delimiter: "")  
            else
                  @convidadopor = nil
                  @valorPago = nil
                  @valorRestante = nil               
          end

          if @lider_geracao
                  @nome_lider = @lider_geracao.sivic_pessoa.nome_pessoa     
            else
                  @nome_lider = nil               
          end

          @dados[cont1] =  Array({:nome => task.sivic_pessoa.nome_pessoa, 
                           :convidadopor => @convidadopor,
                           :vlrPagoPart =>  number_to_currency(task.sivic_movimentofinanceiro.VALR_movimento, unit: "R$", separator: ",", delimiter: ""),
                           :vlrResPart => number_to_currency(task.sivic_movimentofinanceiro.valr_restante, unit: "R$", separator: ",", delimiter: ""), 
                           :valorPago => @valorPago, 
                           :valorRestante => @valorRestante, 
                           :lider => @nome_lider})
      cont1 += 1

    end
    

    debugger 
     @dados.each do |dado|       
      report.list.add_row do |row|
          
            row.values lblNome: dado[0].last rescue nil
            row.values lblConvidadoPor: dado[1].last rescue nil
            row.values lblVlrPagoPart: dado[2].last rescue nil
            row.values lblVlrResPart:  dado[3].last rescue nil
            row.values lblValorPago:  dado[4].last rescue nil
            row.values lblValorRestante:  dado[5].last rescue nil
            row.values lblLider:  dado[6].last rescue nil


            row.values lblCont: contNum
            contNum += 1
          
          end

      report.page.item(:lblNomeIgreja).value(current_user.sivic_pessoa.sivic_igreja.NOME_igreja)
      report.page.item(:data).value(Time.now.strftime("%d/%m/%Y"))
      report.page.item(:operador).value(current_user.sivic_pessoa.nome_pessoa)
      report.page.item(:lblNomeEvento).value(@desc_evento)
      report.page.item(:lblDataEvento).value(@data_inicio)

     end

      if params[:tipo] == '1'
        report.page.item(:lblTipoRelatorio).value('Passando')
      else
        report.page.item(:lblTipoRelatorio).value('Servindo')
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