class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :sivic_pessoa

 	has_many :inclusao, :class_name => "SivicMovimentofinanceiro"
	has_many :exclusao, :class_name => "SivicMovimentofinanceiro"

	has_many :UsuarioInclusao, :class_name => "SivicDiscipulo"
	has_many :UsuarioBloqueio, :class_name => "SivicDiscipulo"
   
   
   #Perfis de Permissão
  ROLES = %w[ADMINISTRADOR LIDER_DE_CELULAS LIDER_DE_GERACAO ADMIN]

end
