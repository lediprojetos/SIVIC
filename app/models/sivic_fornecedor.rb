class SivicFornecedor < ActiveRecord::Base
  belongs_to :sivic_endereco
  belongs_to :sivic_igreja
  belongs_to :user

    
  belongs_to :sivic_endereco, :dependent => :destroy

  accepts_nested_attributes_for :sivic_endereco, allow_destroy: true

  validates :nome_fornecedor, :presence => { :message => 'Digite nome do fornecedor'}


  before_validation :retiraMascara


  def retiraMascara
      self.numr_cpf.gsub!(/[^0-9]/, '')
      self.numr_cnpj.gsub!(/[^0-9]/, '')     
  end

end
