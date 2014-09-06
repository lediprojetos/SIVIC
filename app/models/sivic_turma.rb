class SivicTurma < ActiveRecord::Base
  belongs_to :sivic_igreja
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"	
  belongs_to :bloqueio, :class_name => "User", :foreign_key => "user_bloqueio" 
  belongs_to :sivic_curso


  validates :sivic_curso_id, :presence => {:message => 'Selecione um curso'}
  validates :DESC_turma, :presence => {:message => 'Digite a descricao da turma'}
  validates :numr_faltareprovado, :presence => {:message => 'Digite o numero de faltas'}


   validates_numericality_of :numr_mediareprovado, :only_integer => true, :allow_nil => false, 
   							 :greater_than_or_equal_to => 0, 	
   							 :less_than_or_equal_to => 100, 
   							 :message => "Media reprovado deve ser entre 0 e 100"


   validates_numericality_of :numr_mediarecuperacao	, :only_integer => true, :allow_nil => false, 
   							 :greater_than_or_equal_to => 0, 	
   							 :less_than_or_equal_to => 100, 
   							 :message => "Media recuperacao deve ser entre 0 e 100"


   validates_numericality_of :numr_mediaaprovado, :only_integer => true, :allow_nil => false, 
   							 :greater_than_or_equal_to => 0, 	
   							 :less_than_or_equal_to => 100, 
   							 :message => "Media aprovado deve ser entre 0 e 100"


end
