class SivicContcelula < ActiveRecord::Base
  belongs_to :sivic_igreja, :dependent => :delete
end
