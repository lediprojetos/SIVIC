class AddDatAencerramentoToSivicEventos < ActiveRecord::Migration
  def change
    add_column :sivic_eventos, :DATA_encerramento, :datetime
  end
end
