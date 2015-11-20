class CreateAnswersConcepts < ActiveRecord::Migration
  def change
    create_table :answers_concepts, :id => false do |t|
      t.references :answer, index: true
      t.references :concept, index: true

      t.timestamps null: false
    end
  end
end
