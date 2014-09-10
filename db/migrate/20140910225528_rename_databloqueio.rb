class RenameDatabloqueio < ActiveRecord::Migration
 def self.up
    rename_column :sivic_professors, :DATA_bloqueio, :data_bloqueio 
  end

  def self.down
    rename_column :sivic_professors, :data_bloqueio, :DATA_bloqueio 
  end
end
