class SivicRelatorioscelulasController < ApplicationController
  before_action :set_sivic_relatorioscelula, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  include ActionView::Helpers::NumberHelper

  
  def celulasIndex


   @sivic_relatorioscelulas = SivicRelatorioscelula.joins(:sivic_celula).where(sivic_celulas: {sivic_igreja_id: current_user.sivic_pessoa.sivic_igreja_id})


   #@sivic_Observacoesrelatorios = Observacoesrelatorio.where(:sivic_relatorioscelula_id => params[:id])

  #@sivic_celulas = SivicCelula.find_by_name_or_all(params[:q],current_user.sivic_pessoa.sivic_igreja_id).paginate(:page => params[:page], :per_page => 10)
   
  end

  def frequenciaCelula

 # debugger

  if params[:data_inicio] && params[:data_inicio] != "" 
      dateInicio = Date.parse(params[:data_inicio]).to_date
  end
  if params[:data_fim] && params[:data_fim] != ""
     dateFim = Date.parse(params[:data_fim]).to_date
  end
   
   
    @sivic_relatoriofrequencia = SivicRelatorioscelula.where("data_reuniao >= :data_inicio AND data_reuniao <= :data_fim AND sivic_celula_id = :sivic_celula_id", {data_inicio: dateInicio, data_fim: dateFim, sivic_celula_id:  params[:sivic_celula_id]}).order("data_reuniao")
   
    @sivic_participantescelula =  SivicParticipantecelula.where(sivic_celula_id: params[:sivic_celula_id])

   if @sivic_relatoriofrequencia
    if params[:imprimir] == 'pdf'
       render_frequencia_celula(@sivic_relatoriofrequencia, @sivic_participantescelula,params[:data_inicio],params[:data_fim]) 
    end 

   end

  
  end 


  def relatoriofrequenciaCelula

     @sivic_relatoriofrequencia = SivicRelatorioscelula.where('')

     Client.where("orders_count = ? AND locked = ?", params[:orders], false)
     Client.where("orders_count = #{params[:orders]}")

     Client.where("created_at >= :start_date AND created_at <= :end_date", {start_date: params[:start_date], end_date: params[:end_date]})
   
  end 

  def relEspelhoCelula   
    @sivic_relatorio = SivicRelatorioscelula.find(params[:id])
    @sivic_participantes = SivicPartevenrelacelula.where(sivic_relatorioscelula_id: params[:id])


    respond_to do |format|
      format.html
      format.pdf { render_atividade_celula_espelho(@sivic_relatorio, @sivic_participantes) }
    end

  end


  def lanca_relatorio

       SivicRelatorioscelula.create(:sivic_celula_id => params[:id_celula], :data_reuniao => params[:data_reuniao], :sivic_situacoesrelatorio_id => 5)

      respond_to do |format|
      format.html { redirect_to sivic_relatorioscelulas_url }
      format.json { head :no_content }
    end
      
  end


  def jobCelulas

    if params[:NUMR_Dia] != nil
     
      SivicRelatorioscelula.update_all( "sivic_situacoesrelatorio_id = 4"," sivic_situacoesrelatorio_id = 5")

      @celulas = SivicCelula.where(:NUMR_Dia => params[:NUMR_Dia],:flag_gerarelatorio => true)

      @celulas.each do |sivic_celula|

        SivicRelatorioscelula.create(:sivic_celula_id => sivic_celula.id, :data_reuniao => Time.now, :sivic_situacoesrelatorio_id => 5)

      end

    else

      @celulas = SivicCelula.all
      
    end

   

  end


  def altera_situacao
    #sivic_relatorio = SivicRelatorioscelula.where(:id => params[:id])
    #sivic_relatorio.update(:sivic_situacoesrelatorio_id => params[:sivic_situacoesrelatorio_id])

    sivic_evento = SivicRelatorioscelula.find_by_id(params[:sivic_relatorioscelula_id])
    sivic_situacoesrelatorio_id =  params[:sivic_situacoesrelatorio_id]

    if sivic_evento.sivic_situacoesrelatorio_id != 3     
       if sivic_situacoesrelatorio_id == "3"
          @sivic_movimentofinanceiro = SivicMovimentofinanceiro.create(:VALR_movimento => sivic_evento.VALR_Oferta, :user_inclusao => current_user.id, :FLAG_baixa => nil, :sivic_tipmovfinanceiro_id => 1, :sivic_evento_id => nil, :DATA_exclusao => nil, :user_exclusao => nil, :DESC_movimento => 'Relatorio de Celula' )
          sivic_evento.sivic_movimentofinanceiro_id = @sivic_movimentofinanceiro.id
      end
    end

    sivic_evento.sivic_situacoesrelatorio_id = params[:sivic_situacoesrelatorio_id]
    sivic_evento.save

    respond_to do |format|
    format.html { redirect_to sivic_relatorioscelulas_path }
    format.json { head :no_content }
    
    end    

  end


  # GET /sivic_relatorioscelulas
  # GET /sivic_relatorioscelulas.json
  def index

    if params[:sivic_situacoesrelatorio_id] == nil
      params[:sivic_situacoesrelatorio_id] = '0'
    end

    if params[:nome_pessoa] == nil
      params[:nome_pessoa] = '0'
    end

    if params[:sivic_situacoesrelatorio_id] != '0' && params[:nome_pessoa] != '0'
      if current_user.role == 'LIDER_DE_CELULAS'
        @sivic_relatorioscelulas = SivicRelatorioscelula.joins('INNER JOIN sivic_celulas sp on sivic_celula_id = sp.id  INNER JOIN sivic_pessoas p on sp.sivic_pessoa_id = p.id and p.id = ' + current_user.sivic_pessoa.id.to_s).where('lower(p.nome_pessoa) like ? and sivic_situacoesrelatorio_id ='+ params[:sivic_situacoesrelatorio_id].to_s, "%#{params[:nome_pessoa]}%").paginate(:page => params[:page], :per_page => 10)
      else
        @sivic_relatorioscelulas = SivicRelatorioscelula.joins('INNER JOIN sivic_celulas sp on sivic_celula_id = sp.id  INNER JOIN sivic_pessoas p on sp.sivic_pessoa_id = p.id').where('lower(p.nome_pessoa) like ? and p.sivic_igreja_id = ? and sivic_situacoesrelatorio_id ='+ params[:sivic_situacoesrelatorio_id].to_s, "%#{params[:nome_pessoa]}%", current_user.sivic_pessoa.sivic_igreja_id.to_s).paginate(:page => params[:page], :per_page => 10)
      end
    elsif params[:sivic_situacoesrelatorio_id] != '0'
      if current_user.role == 'LIDER_DE_CELULAS'     
        @sivic_relatorioscelulas = SivicRelatorioscelula.joins('INNER JOIN sivic_celulas sp on sivic_celula_id = sp.id  INNER JOIN sivic_pessoas p on sp.sivic_pessoa_id = p.id and p.id = ' + current_user.sivic_pessoa.id.to_s).where('sivic_situacoesrelatorio_id = ' + params[:sivic_situacoesrelatorio_id].to_s + 'and sivic_situacoesrelatorio_id ='+ params[:sivic_situacoesrelatorio_id].to_s).paginate(:page => params[:page], :per_page => 10)
      else
   
        #@sivic_relatorioscelulas = SivicRelatorioscelula.where(:sivic_situacoesrelatorio_id => params[:sivic_situacoesrelatorio_id]).paginate(:page => params[:page], :per_page => 10)
        @sivic_relatorioscelulas = SivicRelatorioscelula.joins('INNER JOIN sivic_celulas sp on sivic_celula_id = sp.id  INNER JOIN sivic_pessoas p on sp.sivic_pessoa_id = p.id').where('sivic_situacoesrelatorio_id = ? and p.sivic_igreja_id =' + current_user.sivic_pessoa.sivic_igreja_id.to_s, params[:sivic_situacoesrelatorio_id].to_s).paginate(:page => params[:page], :per_page => 10)
      end
    elsif params[:nome_pessoa] != '0'
      if current_user.role == 'LIDER_DE_CELULAS'
     
        @sivic_relatorioscelulas = SivicRelatorioscelula.joins('INNER JOIN sivic_celulas sp on sivic_celula_id = sp.id INNER JOIN sivic_pessoas p on sp.sivic_pessoa_id = p.id and p.id = ' + current_user.sivic_pessoa.id.to_s).where('lower(p.nome_pessoa) like ?', "%#{params[:nome_pessoa]}%").paginate(:page => params[:page], :per_page => 10)
      else
        @sivic_relatorioscelulas = SivicRelatorioscelula.joins('INNER JOIN sivic_celulas sp on sivic_celula_id = sp.id INNER JOIN sivic_pessoas p on sp.sivic_pessoa_id = p.id').where('lower(p.nome_pessoa) like ? and p.sivic_igreja_id ='+ current_user.sivic_pessoa.sivic_igreja_id.to_s, "%#{params[:nome_pessoa]}%").paginate(:page => params[:page], :per_page => 10)
      end
    elsif
      if current_user.role == 'LIDER_DE_CELULAS'
        
        @sivic_relatorioscelulas = SivicRelatorioscelula.joins('INNER JOIN sivic_celulas cel on sivic_celula_id = cel.id').where('cel.sivic_pessoa_id' => current_user.sivic_pessoa.id).paginate(:page => params[:page], :per_page => 10)
      else 
        @sivic_relatorioscelulas = SivicRelatorioscelula.joins(:sivic_celula).where(sivic_celulas: {sivic_igreja_id: current_user.sivic_pessoa.sivic_igreja_id}).paginate(:page => params[:page], :per_page => 10)
      end
    end
  end

  # GET /sivic_relatorioscelulas/1
  # GET /sivic_relatorioscelulas/1.json
  def show
    @sivic_partevenrelacelulas = SivicParticipantecelula.all

    @sivic_Observacoesrelatorios = Observacoesrelatorio.where(:sivic_relatorioscelula_id => params[:id])
  end

  # GET /sivic_relatorioscelulas/new
  def new
    @sivic_relatorioscelula = SivicRelatorioscelula.new
  end

  # GET /sivic_relatorioscelulas/1/edit
  def edit
    @sivic_Observacoesrelatorios = Observacoesrelatorio.where(:sivic_relatorioscelula_id => params[:id])
  end

  # POST /sivic_relatorioscelulas
  # POST /sivic_relatorioscelulas.json
  def create
 
    @valor_oferta = sivic_relatorioscelula_params[:VALR_Oferta] 
    @valor_oferta = @valor_oferta.gsub('.', '')
    @valor_oferta = @valor_oferta.gsub(',', '.').to_f
    @sivic_relatorioscelula = SivicRelatorioscelula.new(sivic_relatorioscelula_params)
    @sivic_relatorioscelula.VALR_Oferta = @valor_oferta


    respond_to do |format|
      if @sivic_relatorioscelula.save
        format.html { redirect_to @sivic_relatorioscelula, notice: 'Registro inserido com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sivic_relatorioscelula }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_relatorioscelula.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_relatorioscelulas/1
  # PATCH/PUT /sivic_relatorioscelulas/1.json
  def update
    
    @valor_oferta = sivic_relatorioscelula_params[:VALR_Oferta] 
    
    @valor_oferta = @valor_oferta.gsub('.', '')
    @valor_oferta = @valor_oferta.gsub(',', '.').to_f
   
    @sivic_relatorioscelula.data_reuniao = sivic_relatorioscelula_params[:data_reuniao]
    @sivic_relatorioscelula.DATA_Horainicio = sivic_relatorioscelula_params[:DATA_Horainicio]
    @sivic_relatorioscelula.DATA_HoraTermino = sivic_relatorioscelula_params[:DATA_HoraTermino]
    @sivic_relatorioscelula.NUMR_NumVisitante = sivic_relatorioscelula_params[:NUMR_NumVisitante]
    @sivic_relatorioscelula.NUMR_NumParticipante = sivic_relatorioscelula_params[:NUMR_NumParticipante]
    @sivic_relatorioscelula.DESC_AssuntoEstudo = sivic_relatorioscelula_params[:DESC_AssuntoEstudo]
    @sivic_relatorioscelula.DESC_TextoBiblico = sivic_relatorioscelula_params[:DESC_TextoBiblico]
    @sivic_relatorioscelula.VALR_Oferta = @valor_oferta
    @sivic_relatorioscelula.NUMR_Decisoes = sivic_relatorioscelula_params[:NUMR_Decisoes]
    @sivic_relatorioscelula.DESC_OutrasInformacoes = sivic_relatorioscelula_params[:DESC_OutrasInformacoes]
    @sivic_relatorioscelula.DATA_HoraTermino = sivic_relatorioscelula_params[:DATA_HoraTermino]
    @sivic_relatorioscelula.sivic_situacoesrelatorio_id = sivic_relatorioscelula_params[:sivic_situacoesrelatorio_id]
    @sivic_relatorioscelula.NUMR_QtdNovoConvertido = sivic_relatorioscelula_params[:NUMR_QtdNovoConvertido]
    @sivic_relatorioscelula.NUMR_QtdResgate = sivic_relatorioscelula_params[:NUMR_QtdResgate]
    @sivic_relatorioscelula.NUMR_QtdPreEncontro = sivic_relatorioscelula_params[:NUMR_QtdPreEncontro]
    @sivic_relatorioscelula.NUMR_QtdEncontro = sivic_relatorioscelula_params[:NUMR_QtdEncontro]
    @sivic_relatorioscelula.NUMR_QtdPosEncontro = sivic_relatorioscelula_params[:NUMR_QtdPosEncontro]
    @sivic_relatorioscelula.NUMR_QtdEscoLid1 = sivic_relatorioscelula_params[:NUMR_QtdEscoLid1]
    @sivic_relatorioscelula.NUMR_EscoLid2 = sivic_relatorioscelula_params[:NUMR_EscoLid2]
    @sivic_relatorioscelula.NUMR_EscoLid3 = sivic_relatorioscelula_params[:NUMR_EscoLid3]
    @sivic_relatorioscelula.NUMR_QtdLidCelula = sivic_relatorioscelula_params[:NUMR_QtdLidCelula]
   
       
    respond_to do |format|
      if @sivic_relatorioscelula.save
        format.html { redirect_to @sivic_relatorioscelula, notice: 'Registro alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_relatorioscelula.errors, status: :unprocessable_entity }
      end
    end
  end


  def render_atividade_celula_espelho(tasks,participantes)
  report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'relatorio_celula.tlf')

  @cont = 1

  if participantes
     for  participante in participantes   
          report.list.add_row do |row|
            row.values  lblNr: @cont
            row.values lblNomeParticipante: participante.sivic_participantecelula.nome_participante
            row.values lblSituacao:participante.sivic_sitpartcelula.DESC_situacao

            @cont = @cont + 1
           end
      end
  end

 report.events.on :generate  do |e|
   e.pages.each do |page|

    page.item(:data).value(Time.now)
    page.item(:operador).value(current_user.sivic_pessoa.nome_pessoa)
    page.item(:lblNomeIgreja).value(current_user.sivic_pessoa.sivic_igreja.NOME_igreja)
    page.item(:lblNome).value(tasks.sivic_celula.sivic_pessoa.nome_pessoa)
    page.item(:lblDataReuniao).value(tasks.data_reuniao)
    page.item(:lblHoraInicio).value(tasks.DATA_Horainicio)
    page.item(:lblHoraFim).value(tasks.DATA_HoraTermino)

  end
end

  #report.page.item(:data).value(Time.now)
  #report.page.item(:operador).value(current_user.sivic_pessoa.nome_pessoa)
  #report.page.item(:lblNomeIgreja).value(current_user.sivic_pessoa.sivic_igreja.NOME_igreja)
  
  send_data report.generate, filename: 'espelho_celula.pdf', 
                             type: 'application/pdf', 
                             disposition: ''
end





def render_frequencia_celula(tasks,participantes,dtInicio,dtFim)
   report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'frequencia_celula.tlf')


  p = 1
  tasks.each  do |task|
   report.list do |list|
      list.header do |header|
      if p == 1 
           header.values lbld1: task.data_reuniao.strftime("%d/%m/%y")
        elsif p == 2
          header.values lbld2: task.data_reuniao.strftime("%d/%m/%y")
        elsif p == 3
          header.values lbld3: task.data_reuniao.strftime("%d/%m/%y")
        elsif p == 4
          header.values lbld4: task.data_reuniao.strftime("%d/%m/%y")
        elsif p == 5
          header.values lbld5: task.data_reuniao.strftime("%d/%m/%y")
        elsif p == 6
          header.values lbld6: task.data_reuniao.strftime("%d/%m/%y")
        elsif p == 7
          header.values lbld7: task.data_reuniao.strftime("%d/%m/%y")
        elsif p == 8
          header.values lbld8: task.data_reuniao.strftime("%d/%m/%y")
        elsif p == 9
          header.values lbld9: task.data_reuniao.strftime("%d/%m/%y")
        elsif p == 10
          header.values lbld10: task.data_reuniao.strftime("%d/%m/%y")
        elsif p == 11
          header.values lbld11: task.data_reuniao.strftime("%d/%m/%y")
        elsif p == 12
          header.values lbld12: task.data_reuniao.strftime("%d/%m/%y")
        end
      end
      p = p + 1
   end
  end


@cont = 1 
#Começa aqui os participantes com as faltas
participantes.each do |participante|  
   
    report.list.add_row do |row|
       row.values  lblNr: @cont
       row.values lblNome: participante.nome_participante

    
  posicao = 1
  @falta = 0 
  @prese = 0

  tasks.each  do |task|
 
    @x  =  SivicPartevenrelacelula.where(sivic_relatorioscelula_id: task.id, sivic_participantecelula_id: participante.id )       
  if posicao == 1
       if @x.first
         row.values lblf1:'P'
         @prese = @prese + 1
         else
         row.values lblf1: 'F'
          @falta =  @falta + 1
       end
  elsif posicao == 2  
      
      if @x.first
         row.values lblf2: 'P'
         @prese = @prese + 1
         else
         row.values lblf2: 'F'
         @falta =  @falta + 1
       end
  elsif posicao == 3

      if @x.first
         row.values lblf3: 'P'
         @prese = @prese + 1
         else
         row.values lblf3: 'F'
         @falta =  @falta + 1
       end
  elsif posicao == 4
       if @x.first
         row.values lblf4: 'P'
         @prese = @prese + 1
         else
         row.values lblf4: 'F'
         @falta =  @falta + 1
       end
  elsif posicao == 5 
       if @x.first
         row.values lblf5: 'P'
         @prese = @prese + 1
         else
         row.values lblf5: 'F'
         @falta =  @falta + 1
       end
  elsif posicao == 6
       if @x.first
         row.values lblf6: 'P'
         @prese = @prese + 1
         else
         row.values lblf6: 'F'
         @falta =  @falta + 1
       end
  elsif posicao == 7
       if @x.first
         row.values lblf7: 'P'
         @prese = @prese + 1
         else
         row.values lblf7: 'F'
         @falta =  @falta + 1
       end
  elsif posicao == 8
   
       if @x.first
         row.values lblf8: 'P'
         @prese = @prese + 1
         else
         row.values lblf8: 'F'
         @falta =  @falta + 1
       end
  elsif posicao == 9
   
       if @x.first
         row.values lblf9: 'P'
         @prese = @prese + 1
         else
         row.values lblf9: 'F'
         @falta =  @falta + 1
       end   
  elsif posicao == 10
   
       if @x.first
         row.values lblf10: 'P'
         @prese = @prese + 1
         else
         row.values lblf10: 'F'
         @falta =  @falta + 1
       end
  elsif posicao == 11
   
       if @x.first
         row.values lblf11: 'P'
         @prese = @prese + 1
         else
         row.values lblf11: 'F'
         @falta =  @falta + 1
       end
  elsif posicao == 12
   
       if @x.first
         row.values lblf12: 'P'
         @prese = @prese + 1
         else
         row.values lblf12: 'F'
         @falta =  @falta + 1
       end
   end
    
     row.values lblTF: @falta
     row.values lblTP: @prese

      posicao = posicao + 1
         
    end
                    
       @cont = @cont + 1
     end
  end

 report.events.on :generate  do |e|
   e.pages.each do |page|

    page.item(:operador).value(current_user.sivic_pessoa.nome_pessoa)
    page.item(:lblNomeIgreja).value(current_user.sivic_pessoa.sivic_igreja.NOME_igreja)
    page.item(:lblNomeLider).value(tasks.first.sivic_celula.sivic_pessoa.nome_pessoa)
    page.item(:lblDtInicio).value(dtInicio)
    page.item(:lblDtfim).value(dtFim)

  end
end

  
  send_data report.generate, filename: 'frequencia_celula.pdf', 
                             type: 'application/pdf', 
                             disposition: ''
end

  # DELETE /sivic_relatorioscelulas/1
  # DELETE /sivic_relatorioscelulas/1.json
  def destroy
    @sivic_relatorioscelula.destroy
    respond_to do |format|
      format.html { redirect_to sivic_relatorioscelulas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_relatorioscelula
      @sivic_relatorioscelula = SivicRelatorioscelula.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_relatorioscelula_params
      params.require(:sivic_relatorioscelula).permit(:sivic_celula_id, :data_reuniao, :DATA_Horainicio, :DATA_HoraTermino, :NUMR_NumVisitante, :NUMR_NumParticipante, :DESC_AssuntoEstudo, :DESC_TextoBiblico, :VALR_Oferta, :NUMR_Decisoes, :DESC_OutrasInformacoes, :sivic_situacoesrelatorio_id, :NUMR_QtdNovoConvertido, :NUMR_QtdResgate, :NUMR_QtdPreEncontro, :NUMR_QtdEncontro, :NUMR_QtdPosEncontro, :NUMR_QtdEscoLid1, :NUMR_EscoLid2, :NUMR_EscoLid3, :NUMR_QtdLidCelula)
    end
end
