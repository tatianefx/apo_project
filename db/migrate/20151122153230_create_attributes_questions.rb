class CreateAttributesQuestions < ActiveRecord::Migration
  def change
    create_table :attributes_questions, :id => false do |t|
      t.references :attribute, index: true
      t.references :question, index: true
    end
  end
end
