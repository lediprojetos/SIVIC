class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string

	    User.create(:email => "diel.faria@gmail.com", :password => "leidof31", :password_confirmation => "leidof31", :role => "ADMINISTRADOR")
  end
end
