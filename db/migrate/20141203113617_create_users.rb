class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		
  		t.string	:name
  		t.string	:username
  		t.string	:email
  		t.string 	:password_hash

  		t.timestamps
  	end

    # Unique true ensures record isn't created twice on accident, ie. submit pressed 2x
    add_index :users, :email, unique: true
  
  end
end
