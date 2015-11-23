class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text
      t.integer :type_question
      t.integer :order
      t.integer :scale_colors
    end
  end
end
