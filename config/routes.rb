SIVIC::Application.routes.draw do

  resources :sivic_parteventos
  resources :sivic_partevenrelacelulas
  resources :sivic_participantecelulas
  resources :sivic_movimentofinanceiros
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

  resources :sivic_igrejas do 
    resources :sivic_enderecos
  end

  resources :sivic_estados do
    resources :sivic_cidades
  end

  root  'static_pages#home'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'

  match '/listarCidade', to: 'sivic_igrejas#get_cities', via: 'get'
  match '/criarPessoa', to: 'sivic_pessoas#create_pessoa', via: 'get'
  match '/listarPessoa', to: 'sivic_pessoas#busca_pessoa', via: 'get'

  devise_for :users, :controllers => {:registrations => "users/registrations"}

end
