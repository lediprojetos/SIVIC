class SivicEvento < ActiveRecord::Base
  belongs_to :User
  belongs_to :sivic_igreja
  belongs_to :sivic_endereco
  belongs_to :sivic_tipo_evento
  
  belongs_to :sivic_endereco, :dependent => :destroy
  
  accepts_nested_attributes_for :sivic_endereco, allow_destroy: true

  def self.find_by_name_or_all(query)
    if query
      self.where('desc_evento like ?', "%#{query}%")
    else
      self.all
    end    
  end

    
end
