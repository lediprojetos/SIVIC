class SivicAula < ActiveRecord::Base
  belongs_to :sivic_igreja
  belongs_to :sivic_turmamoduloprofessor
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"	



   after_create :sincroniza_aulas

   def sincroniza_aulas
     
      @alunos =  SivicTurmaaluno.find :all, :conditions => {:sivic_turma_id => self.sivic_turmamoduloprofessor.sivic_turma_id}
      @alunos.each do |aluno|
    
      	SivicAlunoaula.create(:sivic_turmaaluno_id => aluno.id, :sivic_aula_id => self.id, :flag_ausente => 1)
      
      end
   end

end
