class SivicLicao < ActiveRecord::Base
  belongs_to :sivic_igreja
  belongs_to :sivic_turmamoduloprofessor
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"	

  validates :nome_licao, :presence => { :message => 'Digite a Data Fim' }


  after_create :sincroniza_notas

  def sincroniza_notas
     
      @alunos =  SivicTurmaaluno.find :all, :conditions => {:sivic_turma_id => self.sivic_turmamoduloprofessor.sivic_turma_id}
      @alunos.each do |aluno|
      	
      	SivicNotaaluno.create(:nota => 0, :sivic_licao_id => self.id, :sivic_turmaaluno_id => aluno.id)

      end
  end

end
