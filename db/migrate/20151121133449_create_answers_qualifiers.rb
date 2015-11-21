class CreateAnswersQualifiers < ActiveRecord::Migration
  def change
    create_table :answers_qualifiers, :id => false do |t|
      t.references :answer, index: true
      t.references :qualifier, index: true

      t.timestamps null: false
    end
  end
end
