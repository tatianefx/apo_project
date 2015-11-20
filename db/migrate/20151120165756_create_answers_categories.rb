class CreateAnswersCategories < ActiveRecord::Migration
  def change
    create_table :answers_categories, :id => false do |t|
      t.references :answer, index: true
      t.references :category, index: true

      t.timestamps null: false
    end
  end
end
