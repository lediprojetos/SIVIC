class SivicUserpermissao < ActiveRecord::Base
  belongs_to :sivic_permissao
  belongs_to :user
end
