class SivicAula < ActiveRecord::Base
  belongs_to :sivic_igreja
  belongs_to :sivic_turmamoduloprofessor
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"	



   after_create :sincroniza_aulas

   def sincroniza_aulas


     @alunos =  SivicTurmaaluno.find :all, :conditions => {:id => self.sivic_turmamoduloprofessor.sivic_turma_id}
    

     self.id

   	
   end

end
