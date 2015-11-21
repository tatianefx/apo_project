class CreateQualifiers < ActiveRecord::Migration
  def change
    create_table :qualifiers do |t|
      t.string :text
      t.integer :begin_
      t.integer :end_

      t.timestamps null: false
    end
  end
end
