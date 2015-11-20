class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text
      t.integer :type
      t.integer :order
      t.integer :scale_colors

      t.timestamps null: false
    end
  end
end
