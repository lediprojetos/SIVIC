class RenameDataReuniaoToSivicRelatorioscelula < ActiveRecord::Migration
  def self.up
    rename_column :sivic_relatorioscelulas, :DATA_Reuniao, :data_reuniao
  end

  def self.down
    rename_column :sivic_relatorioscelulas, :data_reuniao, :DATA_Reuniao
  end
end
