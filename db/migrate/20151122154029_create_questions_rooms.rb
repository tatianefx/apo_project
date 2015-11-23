class CreateQuestionsRooms < ActiveRecord::Migration
  def change
    create_table :questions_rooms, :id => false do |t|
      t.references :question, index: true
      t.references :room, index: true
    end
  end
end
