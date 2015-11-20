class CreateResidents < ActiveRecord::Migration
  def change
    create_table :residents do |t|
      t.string :apartment_number
      t.string :block
      t.integer :apo_id
      t.string :time_answer
      t.integer :synchronized

      t.timestamps null: false
    end

    add_index :residents, :apo_id

  end
end
