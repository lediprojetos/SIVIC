class RenameMyColumnByHand < ActiveRecord::Migration
  def self.up
    rename_column :sivic_eventos, :DATA_encerramento, :data_encerramento
  end

  def self.down
    rename_column :sivic_eventos, :data_encerramento, :DATA_encerramento
  end
end
