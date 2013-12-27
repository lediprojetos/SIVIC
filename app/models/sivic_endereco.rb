class SivicEndereco < ActiveRecord::Base
  belongs_to :sivic_cidade
  has_many :sivic_igreja
end
