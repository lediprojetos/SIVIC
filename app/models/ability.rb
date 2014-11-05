class Ability
  include CanCan::Ability


  def initialize(user)

     #can :manage, :all if user.role == "ADMINISTRADOR"
     #can :manage, :all if user.role == "ADMIN"
     #can :manage, SivicRelatorioscelula if user.role == "LIDER_DE_CELULAS"
     #can :manage, SivicParticipantecelula if user.role == "LIDER_DE_CELULAS"

     #cannot :manage, SivicIgreja if user.role == "ADMINISTRADOR"
     #cannot :manage, SivicEscolaridade if user.role == "ADMINISTRADOR"

     #Permissões Globais
     #=======================
      can :get_cities, SivicCidade
     #=======================
     
     #Permissões Leandro e Diel
     #=======================
      #can :manage, :all
     #=======================

     @sivic_permissaos = SivicUserpermissao.where(:user_id => user.id)

     @sivic_permissaos.each do | permissao | 

      #SivicDiscipulo
      if permissao.sivic_permissao.sivic_model.nome_model == 'SivicDiscipulo'
        if permissao.sivic_permissao.mumr_acao == 1
          can :create, SivicPessoa
          can :create_pessoa, SivicPessoa
          can :create, SivicDiscipulo
        end

        if permissao.sivic_permissao.mumr_acao
          can :read, SivicPessoa
          can :busca_pessoa, SivicPessoa
          can :read, SivicDiscipulo
          can :busca_discipulos, SivicDiscipulo
          can :relGeracoesIndex, SivicDiscipulo
          can :relMembros, SivicDiscipulo
          can :relAniversariantes, SivicDiscipulo
          can :relDiscipulos, SivicDiscipulo
          can :relGeracoes, SivicDiscipulo
          can :BuscaPessoas2, SivicDiscipulo
          can :render_civic_discipulo_geral_list, SivicDiscipulo
          can :render_aniversariantes, SivicDiscipulo
          can :render_civic_discipulo_geracao_list, SivicDiscipulo
          can :render_sivic_discipulo_mirror, SivicDiscipulo
        end
        if permissao.sivic_permissao.mumr_acao == 3
          can :update, SivicPessoa
          can :edita_nome, SivicPessoa
          can :update, SivicDiscipulo
        end
        if permissao.sivic_permissao.mumr_acao == 4
          can :destroy, SivicPessoa
          can :destroy, SivicDiscipulo
          can :deleta_pessoa_discipulo, SivicDiscipulo
        end
        if permissao.sivic_permissao.mumr_acao == 5
          can :manage, SivicDiscipulo
          can :manage, SivicPessoa
        end        
      end  

      #SivicCelula
      if permissao.sivic_permissao.sivic_model.nome_model == 'SivicCelula'
        if permissao.sivic_permissao.mumr_acao == 1
          can :create, SivicCelula
        end
        if permissao.sivic_permissao.mumr_acao
          can :read, SivicCelula
          can :busca_celulas, SivicCelula
          can :render_civic_celula_list, SivicCelula
          can :render_civic_celula_mirror, SivicCelula
        end
        if permissao.sivic_permissao.mumr_acao == 3
          can :update, SivicCelula
          can :bloquea, SivicCelula
          can :desbloquea, SivicCelula
        end
        if permissao.sivic_permissao.mumr_acao == 4
          can :destroy, SivicCelula
        end
        if permissao.sivic_permissao.mumr_acao == 5
          can :manage, SivicCelula
        end
      end

      #SivicIgreja
      if permissao.sivic_permissao.sivic_model.nome_model == 'SivicIgreja'
        if permissao.sivic_permissao.mumr_acao == 1
          can :create, SivicIgreja
        end
        if permissao.sivic_permissao.mumr_acao
          can :read, SivicIgreja
        end
        if permissao.sivic_permissao.mumr_acao == 3
          can :update, SivicIgreja
        end
        if permissao.sivic_permissao.mumr_acao == 4
          can :destroy, SivicIgreja
        end
        if permissao.sivic_permissao.mumr_acao == 5
          can :manage, SivicIgreja
        end        
      end 

      #User
      if permissao.sivic_permissao.sivic_model.nome_model == 'User'
        if permissao.sivic_permissao.mumr_acao == 1
          can :create, User
        end
        if permissao.sivic_permissao.mumr_acao
          can :read, User
        end
        if permissao.sivic_permissao.mumr_acao == 3
          can :update, User
        end
        if permissao.sivic_permissao.mumr_acao == 4
          can :destroy, User
        end
        if permissao.sivic_permissao.mumr_acao == 5
          can :manage, User
        end        
      end 

      #SivicEvento
      if permissao.sivic_permissao.sivic_model.nome_model == 'SivicEvento'
        if permissao.sivic_permissao.mumr_acao == 1
          can :create, SivicEvento
          can :create, SivicPartevento
        end
        if permissao.sivic_permissao.mumr_acao
          can :read, SivicEvento
          can :buscaEvento, SivicEvento
          can :read, SivicPartevento
        end
        if permissao.sivic_permissao.mumr_acao == 3
          can :update, SivicEvento
          can :update, SivicPartevento
        end
        if permissao.sivic_permissao.mumr_acao == 4
          can :destroy, SivicEvento
          can :encerrar, SivicEvento
          can :destroy, SivicPartevento
        end
        if permissao.sivic_permissao.mumr_acao == 5
          can :manage, SivicEvento
          can :manage, SivicPartevento
        end        
      end

      #SivicMinisterio
      if permissao.sivic_permissao.sivic_model.nome_model == 'SivicMinisterio'
        if permissao.sivic_permissao.mumr_acao == 1
          can :create, SivicMinisterio
        end
        if permissao.sivic_permissao.mumr_acao
          can :read, SivicMinisterio
        end
        if permissao.sivic_permissao.mumr_acao == 3
          can :update, SivicMinisterio
        end
        if permissao.sivic_permissao.mumr_acao == 4
          can :destroy, SivicMinisterio
        end
        if permissao.sivic_permissao.mumr_acao == 5
          can :manage, SivicMinisterio
        end        
      end

      #SivicMinisteriodiscipulo
      if permissao.sivic_permissao.sivic_model.nome_model == 'SivicMinisteriodiscipulo'
        if permissao.sivic_permissao.mumr_acao == 1
          can :create, SivicMinisteriodiscipulo
          can :adicionaministerio, SivicMinisteriodiscipulo
        end
        if permissao.sivic_permissao.mumr_acao
          can :read, SivicMinisteriodiscipulo
          can :read, SivicMinisterio
          can :read, SivicDiscipulo
        end
        if permissao.sivic_permissao.mumr_acao == 3
          can :update, SivicMinisteriodiscipulo
        end
        if permissao.sivic_permissao.mumr_acao == 4
          can :destroy, SivicMinisteriodiscipulo
        end
        if permissao.sivic_permissao.mumr_acao == 5
          can :manage, SivicMinisteriodiscipulo
        end        
      end      

      #SivicTipoEvento
      if permissao.sivic_permissao.sivic_model.nome_model == 'SivicTipoEvento'
        if permissao.sivic_permissao.mumr_acao == 1
          can :create, SivicTipoEvento
        end
        if permissao.sivic_permissao.mumr_acao
          can :read, SivicTipoEvento
        end
        if permissao.sivic_permissao.mumr_acao == 3
          can :update, SivicTipoEvento
        end
        if permissao.sivic_permissao.mumr_acao == 4
          can :destroy, SivicTipoEvento
        end
        if permissao.sivic_permissao.mumr_acao == 5
          can :manage, SivicTipoEvento
        end        
      end

      #SivicRede
      if permissao.sivic_permissao.sivic_model.nome_model == 'SivicRede'
        if permissao.sivic_permissao.mumr_acao == 1
          can :create, SivicRede
        end
        if permissao.sivic_permissao.mumr_acao
          can :read, SivicRede
        end
        if permissao.sivic_permissao.mumr_acao == 3
          can :update, SivicRede
        end
        if permissao.sivic_permissao.mumr_acao == 4
          can :destroy, SivicRede
        end
        if permissao.sivic_permissao.mumr_acao == 5
          can :manage, SivicRede
        end        
      end

      #SivicSituacaodiscipulo
      if permissao.sivic_permissao.sivic_model.nome_model == 'SivicSituacaodiscipulo'
        if permissao.sivic_permissao.mumr_acao == 1
          can :create, SivicSituacaodiscipulo
        end
        if permissao.sivic_permissao.mumr_acao
          can :read, SivicSituacaodiscipulo
        end
        if permissao.sivic_permissao.mumr_acao == 3
          can :update, SivicSituacaodiscipulo
        end
        if permissao.sivic_permissao.mumr_acao == 4
          can :destroy, SivicSituacaodiscipulo
        end
        if permissao.sivic_permissao.mumr_acao == 5
          can :manage, SivicSituacaodiscipulo
        end        
      end

      #SivicRelatorioscelula
      if permissao.sivic_permissao.sivic_model.nome_model == 'SivicRelatorioscelula'
        if permissao.sivic_permissao.mumr_acao == 1
          can :create, SivicRelatorioscelula
          can :create, SivicSitpartcelula
        end
        if permissao.sivic_permissao.mumr_acao
          can :read, SivicRelatorioscelula
          can :read, SivicSitpartcelula
        end
        if permissao.sivic_permissao.mumr_acao == 3
          can :update, SivicRelatorioscelula
          can :update, SivicSitpartcelula
        end
        if permissao.sivic_permissao.mumr_acao == 4
          can :destroy, SivicRelatorioscelula
          can :destroy, SivicSitpartcelula
        end
        if permissao.sivic_permissao.mumr_acao == 5
          can :manage, SivicRelatorioscelula
          can :manage, SivicSitpartcelula
        end        
      end

      #SivicRelatorioscelula
      if permissao.sivic_permissao.sivic_model.nome_model == 'SivicUserpermissao'

        if permissao.sivic_permissao.mumr_acao == 1
          can :manage, SivicUserpermissao
        end 

      end

      #SivicBancos
      if permissao.sivic_permissao.sivic_model.nome_model == 'SivicBanco'
        if permissao.sivic_permissao.mumr_acao == 1
          can :create, SivicBanco
        end
        if permissao.sivic_permissao.mumr_acao
          can :read, SivicBanco
        end
        if permissao.sivic_permissao.mumr_acao == 3
          can :update, SivicBanco
        end
        if permissao.sivic_permissao.mumr_acao == 4
          can :destroy, SivicBanco
        end
        if permissao.sivic_permissao.mumr_acao == 5
          can :manage, SivicBanco
        end        
      end                      

      #SivicContabanco
      if permissao.sivic_permissao.sivic_model.nome_model == 'SivicContabanco'
        if permissao.sivic_permissao.mumr_acao == 1
          can :create, SivicContabanco
        end
        if permissao.sivic_permissao.mumr_acao
          can :read, SivicContabanco
        end
        if permissao.sivic_permissao.mumr_acao == 3
          can :update, SivicContabanco
        end
        if permissao.sivic_permissao.mumr_acao == 4
          can :destroy, SivicContabanco
        end
        if permissao.sivic_permissao.mumr_acao == 5
          can :manage, SivicContabanco
        end        
      end                      

      #SivicFornecedor
      if permissao.sivic_permissao.sivic_model.nome_model == 'SivicFornecedor'
        if permissao.sivic_permissao.mumr_acao == 1
          can :create, SivicFornecedor
        end
        if permissao.sivic_permissao.mumr_acao
          can :read, SivicFornecedor
        end
        if permissao.sivic_permissao.mumr_acao == 3
          can :update, SivicFornecedor
        end
        if permissao.sivic_permissao.mumr_acao == 4
          can :destroy, SivicFornecedor
        end
        if permissao.sivic_permissao.mumr_acao == 5
          can :manage, SivicFornecedor
        end        
      end

      #SivicCategory
      if permissao.sivic_permissao.sivic_model.nome_model == 'SivicCategory'
        if permissao.sivic_permissao.mumr_acao == 1
          can :create, SivicCategory
        end
        if permissao.sivic_permissao.mumr_acao
          can :read, SivicCategory
        end
        if permissao.sivic_permissao.mumr_acao == 3
          can :update, SivicCategory
        end
        if permissao.sivic_permissao.mumr_acao == 4
          can :destroy, SivicCategory
        end
        if permissao.sivic_permissao.mumr_acao == 5
          can :manage, SivicCategory
        end        
      end

      #SivicLancamento
      if permissao.sivic_permissao.sivic_model.nome_model == 'SivicLancamento'
        if permissao.sivic_permissao.mumr_acao == 1
          can :create, SivicLancamento
          can :create_dizimo, SivicLancamento
          can :create_transferencia, SivicLancamento
          can :create_pagamento, SivicLancamento
        end
        if permissao.sivic_permissao.mumr_acao
          can :read, SivicLancamento
          can :extrato, SivicLancamento
          can :contasapagar, SivicLancamento
          can :contasareceber, SivicLancamento
          can :busca_dizimo, SivicLancamento
          can :busca_transferencia, SivicLancamento
          can :seta_periodo, SivicLancamento
          can :busca_lancamento, SivicLancamento
        end
        if permissao.sivic_permissao.mumr_acao == 3
          can :update, SivicLancamento
          can :edita_dizimo, SivicLancamento
          can :edita_transferencia, SivicLancamento
          can :edita_pagaRecebe, SivicLancamento
          can :edita_pagamento, SivicLancamento
        end
        if permissao.sivic_permissao.mumr_acao == 4
          can :destroy, SivicLancamento
          can :deleta_transferencia, SivicLancamento
          can :deleta_lancamento, SivicLancamento
        end
        if permissao.sivic_permissao.mumr_acao == 5
          can :manage, SivicLancamento
        end        
      end                               

    end    
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
