class CreateQualifiers < ActiveRecord::Migration
  def change
    create_table :qualifiers do |t|
      t.string :text
      t.integer :begin
      t.integer :end

      t.timestamps null: false
    end
  end
end
