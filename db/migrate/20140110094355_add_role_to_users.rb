class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string

	    User.create(:sivic_pessoa_id => 1, :email => "diel.faria@gmail.com", :password => "leidof31", :password_confirmation => "leidof31", :role => "ADMINISTRADOR")
	    User.create(:sivic_pessoa_id => 2, :email => "lpgomes@gmail.com", :password => "lpgomes12", :password_confirmation => "lpgomes12", :role => "ADMINISTRADOR")
  end
end
