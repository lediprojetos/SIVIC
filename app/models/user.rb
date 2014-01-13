class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :sivic_pessoas

   #Perfis de Permissão
  ROLES = %w[ADMINISTRADOR LIDER_DE_CELULAS LIDER_DE_GERACAO]

end
