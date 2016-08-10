class CreateComments < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
  		t.integer :commentator_id, {null: false}
  		t.string	:content, {null: false}
  		t.integer	:commentable_id, {null: false}
  		t.string  :commentable_type, {null: false}

  		t.timestamps(null: false)
  	end
  end
end
