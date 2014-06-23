class SivicFornecedor < ActiveRecord::Base
  belongs_to :sivic_endereco
  belongs_to :sivic_igreja
  belongs_to :user
end
