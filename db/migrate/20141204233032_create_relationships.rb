class CreateRelationships < ActiveRecord::Migration
  def change
  	create_table :relationships do |t|
  		t.integer	:follower_id
  		t.integer	:followed_id
  		
      t.timestamps null:false
  	end
  end
  
  add_index :relationships, :follower_id
  add_index :relationships, :followed_id

  #enforces unqiueness so user can't follow another more than once
  add_index :relationships, [:follower_id, :followed_id], unique: true
end
