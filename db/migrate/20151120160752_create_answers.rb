class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :resident_id
      t.integer :question_id
      t.string :text_
      t.integer :apo_id
      t.integer :room_id
      t.integer :concept_id
      t.integer :attribute_id
      t.integer :synchronized
    end

    add_index :answers, :resident_id
    add_index :answers, :question_id
    add_index :answers, :apo_id
    add_index :answers, :room_id
    add_index :answers, :concept_id
    add_index :answers, :attribute_id

  end
end
