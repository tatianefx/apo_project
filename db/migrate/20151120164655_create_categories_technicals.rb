class CreateCategoriesTechnicals < ActiveRecord::Migration
  def change
    create_table :categories_technicals, :id => false do |t|
      t.references :category, index: true
      t.references :technical, index: true
    end
  end
end
