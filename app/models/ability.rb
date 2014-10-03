class Ability
  include CanCan::Ability


  def initialize(user)

     #can :manage, :all if user.role == "ADMINISTRADOR"
     #can :manage, :all if user.role == "ADMIN"
     #can :manage, SivicRelatorioscelula if user.role == "LIDER_DE_CELULAS"
     #can :manage, SivicParticipantecelula if user.role == "LIDER_DE_CELULAS"

     #cannot :manage, SivicIgreja if user.role == "ADMINISTRADOR"
     #cannot :manage, SivicEscolaridade if user.role == "ADMINISTRADOR"


     @sivic_permissaos = SivicUserpermissao.where(:user_id => user.id)

     @sivic_permissaos.each do | permissao | 

      #SivicDiscipulo
      if permissao.sivic_permissao.sivic_model.nome_model == 'SivicDiscipulo'
        if permissao.sivic_permissao.mumr_acao == 1
          can :create, SivicDiscipulo
          can :create, SivicPessoa
        end
        if permissao.sivic_permissao.mumr_acao == 2
          can :read, SivicDiscipulo
          can :read, SivicPessoa
        end
        if permissao.sivic_permissao.mumr_acao == 3
          can :update, SivicDiscipulo
          can :update, SivicPessoa
        end
        if permissao.sivic_permissao.mumr_acao == 4
          can :destroy, SivicDiscipulo
          can :destroy, SivicPessoa
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
        if permissao.sivic_permissao.mumr_acao == 2
          can :read, SivicCelula
        end
        if permissao.sivic_permissao.mumr_acao == 3
          can :update, SivicCelula
        end
        if permissao.sivic_permissao.mumr_acao == 4
          can :destroy, SivicCelula
        end
        if permissao.sivic_permissao.mumr_acao == 5
          can :manage, SivicCelula
        end
      end

      #SivicRelatorioscelula
      if permissao.sivic_permissao.sivic_model.nome_model == 'SivicRelatorioscelula'
        if permissao.sivic_permissao.mumr_acao == 1
          can :create, SivicRelatorioscelula
          can :create, SivicSitpartcelula
        end
        if permissao.sivic_permissao.mumr_acao == 2
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

      #SivicIgreja
      if permissao.sivic_permissao.sivic_model.nome_model == 'SivicIgreja'
        if permissao.sivic_permissao.mumr_acao == 1
          can :create, SivicIgreja
        end
        if permissao.sivic_permissao.mumr_acao == 2
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
        if permissao.sivic_permissao.mumr_acao == 2
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
        if permissao.sivic_permissao.mumr_acao == 2
          can :read, SivicEvento
          can :read, SivicPartevento
        end
        if permissao.sivic_permissao.mumr_acao == 3
          can :update, SivicEvento
          can :update, SivicPartevento
        end
        if permissao.sivic_permissao.mumr_acao == 4
          can :destroy, SivicEvento
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
        if permissao.sivic_permissao.mumr_acao == 2
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

      #SivicTipoEvento
      if permissao.sivic_permissao.sivic_model.nome_model == 'SivicTipoEvento'
        if permissao.sivic_permissao.mumr_acao == 1
          can :create, SivicTipoEvento
        end
        if permissao.sivic_permissao.mumr_acao == 2
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
        if permissao.sivic_permissao.mumr_acao == 2
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
        if permissao.sivic_permissao.mumr_acao == 2
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

    end

    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
