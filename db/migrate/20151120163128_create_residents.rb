class CreateResidents < ActiveRecord::Migration
  def change
    create_table :residents,:id => false do |t|
      t.integer :id
      t.string :apartment_number
      t.string :block
      t.integer :apo_id
      t.string :time_answer
      t.integer :synchronized
    end

    add_index :residents, :apo_id

  end
end
