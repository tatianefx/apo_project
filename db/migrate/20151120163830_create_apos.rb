class CreateApos < ActiveRecord::Migration
  def change
    create_table :apos do |t|
      t.string :name
      t.string :text
      t.string :city
      t.string :state
    end
  end
end
