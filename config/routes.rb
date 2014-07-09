SIVIC::Application.routes.draw do

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
  resources :sivic_discipulos
  resources :sivic_movimentofinanceiros 
  resources :sivic_partevenrelacelulas
  resources :sivic_participantecelulas
  resources :sivic_relatorioscelulas
  resources :sivic_celulas
  resources :sivic_escolaridades
  resources :sivic_ministerios
  resources :sivic_pessoas
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

  match '/jobCelulas', to: 'sivic_relatorioscelulas#jobCelulas', via: 'get'

  get '/relDiscipulos/:id', to: 'sivic_discipulos#relDiscipulos', as: 'relDiscipulos'
  get '/relGeracoes/:id', to: 'sivic_discipulos#relGeracoes', as: 'relGeracoes'


  match '/admin', to: 'static_pages#index', via: 'get'
  match '/listarCidade', to: 'sivic_igrejas#get_cities', via: 'get'
  match '/criarPessoa', to: 'sivic_pessoas#create_pessoa', via: 'get'
  match '/listarPessoa', to: 'sivic_pessoas#busca_pessoa', via: 'get'
  match '/listarDiscipulos', to: 'sivic_discipulos#busca_discipulos', via: 'get'
  match '/listarCelulas', to: 'sivic_celulas#busca_celulas', via: 'get'

  match '/criarParticipantesRelatorios', to: 'sivic_partevenrelacelulas#create_participante', via: 'get'
  match '/listarParticipantesCelulas', to: 'sivic_participantecelulas#busca_participante', via: 'get'
  match '/criarParticipantesCelulas', to: 'sivic_participantecelulas#create_participante', via: 'get'
  match '/listarEvento', to: 'sivic_parteventos#buscaEvento', via: 'get'
  match '/buscaDiagrama', to: 'sivic_discipulos#buscaDiagrama', via: 'get'
  match '/criarEndereco', to: 'sivic_enderecos#create_endereco', via: 'get'
  match '/criarObservacaorelatorio', to: 'observacoesrelatorios#create_observacao', via: 'get'
  match '/alteraSituacao', to: 'sivic_relatorioscelulas#altera_situacao', via: 'get'
  match '/bloqueaCelula', to: 'sivic_celulas#bloquea', via: 'get'
  match '/desbloqueaCelula', to: 'sivic_celulas#desbloquea', via: 'get'
  match '/bloqueaProfessor', to: 'sivic_professors#bloquea', via: 'get'
  match '/bloqueaTurma', to: 'sivic_turmas#bloquea', via: 'get'


  devise_for :users, :controllers => {:registrations => "users/registrations"}

  #Rotas de filtragem
  get '/filtrarelatorios/:sivic_situacoesrelatorio_id/:nome_pessoa', to: 'sivic_relatorioscelulas#index', as: 'filtrarelatorios'
  get '/filtraprofessor/:sivic_professor_situacao_id', to: 'sivic_professors#index', as: 'filtraprofessor'
  get '/filtraturma/:sivic_turma_situacao_id', to: 'sivic_turmas#index', as: 'filtraturma'


   get '/pEventos/:id', to: 'sivic_parteventos#naoParticipou', as: 'pEventos'

   get '/encerraEvento/:id', to: 'sivic_eventos#encerrar', as: 'encerraEvento'

end
