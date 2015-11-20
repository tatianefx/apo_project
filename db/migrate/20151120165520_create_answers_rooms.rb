class CreateAnswersRooms < ActiveRecord::Migration
  def change
    create_table :answers_rooms, :id => false do |t|
      t.references :answer, index: true
      t.references :room, index: true

      t.timestamps null: false
    end
  end
end
