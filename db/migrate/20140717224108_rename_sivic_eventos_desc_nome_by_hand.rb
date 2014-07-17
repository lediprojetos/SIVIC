class RenameSivicEventosDescNomeByHand < ActiveRecord::Migration
  def self.up
    rename_column :sivic_eventos, :DESC_evento, :desc_evento 
  end

  def self.down
    rename_column :sivic_eventos, :desc_evento, :DESC_evento 
  end
end
