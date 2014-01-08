SIVIC::Application.routes.draw do

  devise_for :users
  resources :sivic_tipo_eventos

  resources :sivic_redes

  resources :sivic_igrejas do 
    resources :sivic_enderecos
  end

  root  'static_pages#home'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/listarCidade', to: 'sivic_igrejas#get_cities', via: 'get'



  resources :sivic_estados do
    resources :sivic_cidades
  end


  resources :sivic_tipo_eventos
  resources :sivic_escolaridades
  resources :sivic_profissaos

  
end
