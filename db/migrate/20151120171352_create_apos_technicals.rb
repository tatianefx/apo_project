class CreateAposTechnicals < ActiveRecord::Migration
  def change
    create_table :apos_technicals, :id => false do |t|
      t.references :apo, index: true
      t.references :technical, index: true
    end
  end
end
