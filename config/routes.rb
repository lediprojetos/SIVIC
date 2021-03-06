SIVIC::Application.routes.draw do

  resources :sivic_fechamentos

  resources :sivic_atividadepessoas do
    member do
      get :altera_situacao   
    end
  end

  resources :sivic_situacaoatividades

  resources :sivic_periodicidadecons

  resources :sivic_atividades do
    member do
      get :deleta_atividade
    end
  end

  resources :sivic_planos

  resources :sivic_modulos

  resources :sivic_models

  resources :sivic_contcategories

  resources :sivic_userpermissaos

  resources :sivic_permissaos

  resources :sivic_contatos

  resources :sivic_inscricaos

  resources :sivic_ministeriodiscipulos do
      member do
        get :adicionaministerio
      end
  end


  resources :sivic_situacaodiscipulos do
    member do
      get :deletasituacao
    end
  end
  #get '/deletasituacao/:id', to: 'sivic_situacaodiscipulos#deleta_situacao', as: 'deletasituacao'
  #match '/deletasituacao/:id', to: 'sivic_situacaodiscipulos#deleta_situacao', via: 'patch'

  resources :sivic_notaalunos do
     member do
       get :licaonota
     end
      member do
       get :notaaluno
     end
   
  end

  resources :sivic_alunoaulas do
    member do
       get :aulafrequencia
    end
    member do
      get :frequencia
    end
  end

  resources :sivic_aulas

  resources :sivic_licaos

  resources :sivic_cursos

  resources :sivic_turmaalunos

  resources :sivic_turmamoduloprofessors do
    member do
      get :aula
     end
   end

  resources :sivic_lancamentos

  resources :sivic_categories

  resources :sivic_centrocustos
  resources :sivic_fornecedors
  resources :sivic_contabancos
  resources :sivic_bancos
  resources :sivic_moduloturmas
  resources :sivic_moduloescolas
  resources :sivic_turmas
  resources :sivic_professors
  resources :sivic_contcelulas
  resources :sivic_contdiscipulos
  resources :observacoesrelatorios
  resources :sivic_situacoesrelatorios
  resources :sivic_sitpartcelulas

  resources :sivic_discipulos do
    member do
      get :deleta_pessoa_discipulo
    end
     member do
      get :new1
    end
  end

  resources :sivic_movimentofinanceiros 
  resources :sivic_partevenrelacelulas
  resources :sivic_participantecelulas
  resources :sivic_relatorioscelulas
  resources :sivic_celulas
  resources :sivic_escolaridades
  resources :sivic_ministerios

  resources :sivic_pessoas do
    member do
      get :deleta_pessoa
    end
  end
  
  resources :sivic_eventos
  resources :sivic_tipo_eventos
  resources :sivic_redes
  resources :sivic_tipo_eventos
  resources :sivic_escolaridades
  resources :sivic_profissaos
  resources :sivic_enderecos
  
  resources :sivic_igrejas do 
    resources :sivic_enderecos
  end

  resources :sivic_estados do
    resources :sivic_cidades
  end

  resources :sivic_relatorioscelulas do
    resources :sivic_partevenrelacelulas
  end

  resources :sivic_parteventos do
    resources :sivic_movimentofinanceiros   
  end

  root  'static_pages#home'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/planos', to: 'static_pages#plan', via: 'get'
  match '/report', to: 'static_pages#report', via: 'get'

  match '/participantesEventos', to: 'sivic_parteventos#participanteseventos', via: 'get'
  match '/participanteseventogeracao', to: 'sivic_parteventos#participanteseventogeracao', via: 'get'

  match '/relMembros', to: 'sivic_discipulos#relMembros', via: 'get'
  match '/relAniversariantes', to: 'sivic_discipulos#relAniversariantes', via: 'get'

  match '/jobCelulas', to: 'sivic_relatorioscelulas#jobCelulas', via: 'get'

  match '/lancarRelatorio', to: 'sivic_relatorioscelulas#lanca_relatorio', via: 'get'

  get '/relDiscipulos/:id', to: 'sivic_discipulos#relDiscipulos', as: 'relDiscipulos'
  get '/relGeracoes/:id', to: 'sivic_discipulos#relGeracoes', as: 'relGeracoes'

  get '/relCelulas/:id', to: 'sivic_discipulos#relCelulas', as: 'relCelulas'

  match '/relGeracoesIndex', to: 'sivic_discipulos#relGeracoesIndex', via: 'get'

  match '/relCelulasGeracao', to: 'sivic_discipulos#relCelulasGeracao', via: 'get'

  match '/relCelulasGeracao', to: 'sivic_relatorioscelulas#relCelulasGeracao', via: 'get'


  get '/relEspelhoCelula/:id', to: 'sivic_relatorioscelulas#relEspelhoCelula', as: 'relEspelhoCelula'
  get '/relFrequenciaCelula/:id/:datainicio/:datafim', to: 'sivic_relatorioscelulas#relatoriofrequenciaCelula', as: 'relFrequenciaCelula'
   
  match '/celulasIndex', to: 'sivic_relatorioscelulas#celulasIndex', via: 'get'

  match '/frequenciaCelula', to: 'sivic_relatorioscelulas#frequenciaCelula', via: 'get'


  get '/relparticipantesEventos/:id/:tipo', to: 'sivic_parteventos#relparticipantesEventos', as: 'relparticipantesEventos'
  get '/relparticipantesEventoGeracao/:id/:tipo', to: 'sivic_parteventos#relparticipantesEventoGeracao', as: 'relparticipantesEventoGeracao'


  match '/admin', to: 'static_pages#index', via: 'get'
  match '/listarCidade', to: 'sivic_cidades#get_cities', via: 'get'
  match '/criarPessoa', to: 'sivic_pessoas#create_pessoa', via: 'get'
  match '/listarPessoa', to: 'sivic_pessoas#busca_pessoa', via: 'get'
  match '/editarNome', to: 'sivic_pessoas#edita_nome', via: 'get'
  match '/trocarigreja', to: 'sivic_pessoas#troca_igreja', via: 'get'

  match '/buscacategoria', to: 'sivic_categories#busca_categoria', via: 'get'

  match '/enviacontato', to: 'sivic_contatos#envia_contato', via: 'get'

  match '/listarDiscipulos', to: 'sivic_discipulos#busca_discipulos', via: 'get'
  match '/listarCelulas', to: 'sivic_celulas#busca_celulas', via: 'get'

  match '/criarParticipantesRelatorios', to: 'sivic_partevenrelacelulas#create_participante', via: 'get'
  match '/listarParticipantesCelulas', to: 'sivic_participantecelulas#busca_participante', via: 'get'
  match '/criarParticipantesCelulas', to: 'sivic_participantecelulas#create_participante', via: 'get'
  match '/listarEvento', to: 'sivic_eventos#buscaEvento', via: 'get'
  match '/buscaDiagrama', to: 'sivic_discipulos#buscaDiagrama', via: 'get'
  match '/criarEndereco', to: 'sivic_enderecos#create_endereco', via: 'get'
  match '/criarObservacaorelatorio', to: 'observacoesrelatorios#create_observacao', via: 'get'
  match '/alteraSituacao', to: 'sivic_relatorioscelulas#altera_situacao', via: 'get'
  match '/bloqueaCelula', to: 'sivic_celulas#bloquea', via: 'get'
  match '/desbloqueaCelula', to: 'sivic_celulas#desbloquea', via: 'get'
  match '/buscaTurmaProfessor', to: 'sivic_turmamoduloprofessors#busca_modulo_professor', via: 'get'

  match '/criarTurmaModuloProfessor', to: 'sivic_turmamoduloprofessors#create_turma_modulo_professor', via: 'get'
  
  match '/inserePagamento', to: 'sivic_lancamentos#create_pagamento', via: 'get'
  match '/alteraPagamento', to: 'sivic_lancamentos#edita_pagamento', via: 'get'
  match '/busca_lancamento', to: 'sivic_lancamentos#busca_lancamento', via: 'get'
  match '/editaPagaRecebe', to: 'sivic_lancamentos#edita_pagaRecebe', via: 'get'
  match '/deletaLancamento', to: 'sivic_lancamentos#deleta_lancamento', via: 'get'
  match '/setaPeriodo', to: 'sivic_lancamentos#seta_periodo', via: 'get'
  match '/insereDizimo', to: 'sivic_lancamentos#create_dizimo', via: 'get'
  match '/busca_dizimo', to: 'sivic_lancamentos#busca_dizimo', via: 'get'
  match '/editaDizimo', to: 'sivic_lancamentos#edita_dizimo', via: 'get'

  match '/insereTransferencia', to: 'sivic_lancamentos#create_transferencia', via: 'get'
  match '/editaTransferencia', to: 'sivic_lancamentos#edita_transferencia', via: 'get'
  match '/deletaTransferencia', to: 'sivic_lancamentos#deleta_transferencia', via: 'get'
  match '/buscaTransferencia', to: 'sivic_lancamentos#busca_transferencia', via: 'get'


  match '/listarTurma', to: 'sivic_turmaalunos#busca_turmas', via: 'get'

  get '/contasapagar', to: 'sivic_lancamentos#contasapagar',as: 'contasapagar'
  get '/contasareceber', to: 'sivic_lancamentos#contasareceber',as: 'contasareceber'
  get '/extrato', to: 'sivic_lancamentos#extrato',as: 'extrato'
  get '/extratomensal', to: 'sivic_lancamentos#extrato_mensal',as: 'extrato_mensal'

  match '/criarLicao', to: 'sivic_licaos#create_licao', via: 'get'
  match '/buscaLicao', to: 'sivic_licaos#busca_licao', via: 'get'
  match '/criarAula', to: 'sivic_aulas#create_aula', via: 'get'
  match '/buscaAula', to: 'sivic_aulas#busca_aula', via: 'get'
  match '/buscaAlunoAula', to: 'sivic_alunoaulas#busca_aluno_aula', via: 'get'
  match '/marcaAusente', to: 'sivic_alunoaulas#marcar_ausente', via: 'get'
  match '/marcaPresenca', to: 'sivic_alunoaulas#marcar_presenca', via: 'get'
  match '/buscaNotaAluno', to: 'sivic_notaalunos#busca_nota_aluno', via: 'get'
  match '/usuarios', to: 'sivic_discipulos#usuarios', via: 'get'

  

  devise_for :users, :controllers => {:registrations => "users/registrations"}

  #Rotas de filtragem
  get '/filtrarelatorios/:sivic_situacoesrelatorio_id/:nome_pessoa', to: 'sivic_relatorioscelulas#index', as: 'filtrarelatorios'
  get '/filtraprofessor/:sivic_professor_situacao_id', to: 'sivic_professors#index', as: 'filtraprofessor'
  get '/filtraturma/:sivic_turma_situacao_id', to: 'sivic_turmas#index', as: 'filtraturma'


   get '/pEventos/:id', to: 'sivic_parteventos#naoParticipou', as: 'pEventos'
   get '/encerraEvento/:id', to: 'sivic_eventos#encerrar', as: 'encerraEvento'

   get '/bloqueaProfessor:id', to: 'sivic_professors#bloquea', as: 'bloqueaProfessor'
   get '/desbloqueaProfessor:id', to: 'sivic_professors#desbloquea', as: 'desbloqueaProfessor'

   get '/bloqueaTurmaaluno/:id', to: 'sivic_turmaalunos#bloquea', as: 'bloqueaTurmaaluno'
   get '/desbloqueaTurmaaluno/:id', to: 'sivic_turmaalunos#desbloquea', as: 'desbloqueaTurmaaluno'

   get '/bloqueaTurma/:id', to: 'sivic_turmas#bloquea', as: 'bloqueaTurma'
   get '/desbloqueaTurma/:id', to: 'sivic_turmas#desbloquea', as: 'desbloqueaTurma'
   get '/usuariospermissoes/:id', to: 'sivic_userpermissaos#usuariospermissoes', as: 'usuariospermissoes'
   match '/setaPermissoes', to: 'sivic_userpermissaos#setaPermissoes', via: 'get'


end