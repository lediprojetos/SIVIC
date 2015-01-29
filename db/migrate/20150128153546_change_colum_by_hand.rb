class ChangeColumByHand < ActiveRecord::Migration
  def change
  	change_column :sivic_fechamentos, :valr_fechamento, :decimal, precision: 10, scale: 2
  end
end
