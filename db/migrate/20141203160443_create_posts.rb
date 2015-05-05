class CreatePosts < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.belongs_to	:user
  		
      t.string			:title
  		t.text				:code
  		t.text				:annotations
  		t.text				:resources  		
  		
      t.timestamps
  	end
    add_index :posts, [:user_id, :created_at]
  end
end
