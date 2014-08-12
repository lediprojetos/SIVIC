class CreateSivicAlunoaulas < ActiveRecord::Migration
  def change
    create_table :sivic_alunoaulas do |t|
      t.references :sivic_turmaaluno, index: true
      t.references :sivic_aula, index: true
      t.integer :flag_ausente

      t.timestamps
    end
  end
end
