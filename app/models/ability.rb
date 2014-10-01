class Ability
  include CanCan::Ability


  def initialize(user)

     can :manage, :all if user.role == "ADMINISTRADOR"
     can :manage, :all if user.role == "ADMIN"
     can :manage, SivicRelatorioscelula if user.role == "LIDER_DE_CELULAS"
     can :manage, SivicParticipantecelula if user.role == "LIDER_DE_CELULAS"

     cannot :manage, SivicIgreja if user.role == "ADMINISTRADOR"
     cannot :manage, SivicEscolaridade if user.role == "ADMINISTRADOR"


     #@sivic_permissaos = SivicUserpermissao.where(:user_id => user.id)

     #@sivic_permissaos.each do | permissao | 


      #SivicCelula
      #if permissao.sivic_permissao.sivic_model.nome_model == 'SivicCelula'
        #if permissao.sivic_permissao.mumr_acao == 1
          #can :manage, SivicCelula
        #end
      #end

      #SivicMinisterio
      #if permissao.sivic_permissao.sivic_model.nome_model == 'SivicMinisterio'
        #if permissao.sivic_permissao.mumr_acao == 1
          #can :manage, SivicMinisterio
        #end
      #end      


    #end

    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
