class CreateTechnicals < ActiveRecord::Migration
  def change
    create_table :technicals do |t|
      t.string :name
      t.integer :respondent
    end
  end
end
