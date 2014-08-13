class SivicTurmaaluno < ActiveRecord::Base
  belongs_to :sivic_turma
  belongs_to :sivic_pessoa
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"	
  belongs_to :bloqueio, :class_name => "User", :foreign_key => "user_bloqueio" 


  validates :sivic_pessoa_id, :presence => { :message => ' - Escolha um aluno' }
  validates :sivic_turma_id, :presence => { :message => ' - Escolha uma turma' }


   after_create :sincroniza_aulas

   def sincroniza_aulas    

        @aula =  SivicAula.joins(:sivic_turmamoduloprofessor).where(sivic_turmamoduloprofessors: {sivic_turma_id: self.sivic_turma_id})

      	@aula.each do |aula|
    
      	SivicAlunoaula.create(:sivic_turmaaluno_id => self.id, :sivic_aula_id => aula.id, :flag_ausente => 1)      
      end
   end


end
