class CreateQuestions < ActiveRecord::Migration
  def change
  	create_table :questions do |t|
  		t.integer :asker_id, {null: false}
  		t.string	:title, {null: false}
  		t.string	:content, {null: false}
  		t.integer	:best_answer_id

  		t.timestamps(null: false)
  	end
  end
end
