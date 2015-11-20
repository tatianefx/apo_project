class CreateAnswersAttributes < ActiveRecord::Migration
  def change
    create_table :answers_attributes, :id => false do |t|
      t.references :answer, index: true
      t.references :attribute, index: true

      t.timestamps null: false
    end
  end
end
