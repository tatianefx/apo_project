class CreateQualifiersQuestions < ActiveRecord::Migration
  def change
    create_table :qualifiers_questions, :id => false do |t|
      t.references :qualifier, index: true
      t.references :question, index: true
    end
  end
end
