class Ability
  include CanCan::Ability


  def initialize(user)

     can :manage, :all if user.role == "ADMINISTRADOR"
     can :manage, :all if user.role == "ADMIN"
     can :manage, SivicRelatorioscelula if user.role == "LIDER_DE_CELULAS"
     can :manage, SivicParticipantecelula if user.role == "LIDER_DE_CELULAS"

     cannot :manage, SivicIgreja if user.role == "ADMINISTRADOR"
     cannot :manage, SivicEscolaridade if user.role == "ADMINISTRADOR"


    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
