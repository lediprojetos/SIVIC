class SivicProfessor < ActiveRecord::Base
  belongs_to :sivic_pessoa
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"	
  belongs_to :exclusao, :class_name => "User", :foreign_key => "user_bloqueio" 


 validates :sivic_pessoa_id, :presence => {:message => 'Escolha um professor'}

  def nome_professor
     self.sivic_pessoa.nome_pessoa
  end

end
