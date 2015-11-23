class CreateCategoriesQuestions < ActiveRecord::Migration
  def change
    create_table :categories_questions, :id => false do |t|
      t.references :category, index: true
      t.references :question, index: true
    end
  end
end
