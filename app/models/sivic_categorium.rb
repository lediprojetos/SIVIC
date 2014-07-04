class SivicCategorium < ActiveRecord::Base
  belongs_to :user
  belongs_to :sivic_igreja
end
