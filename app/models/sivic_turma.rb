class SivicTurma < ActiveRecord::Base
  belongs_to :sivic_igreja
  belongs_to :user
  belongs_to :user
end
