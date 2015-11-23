class CreateConceptsQuestions < ActiveRecord::Migration
  def change
    create_table :concepts_questions, :id => false do |t|
      t.references :concept, index: true
      t.references :question, index: true
    end
  end
end
