class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :title
      t.text :description
      t.time :start
      t.time :finish

      t.timestamps null: false
    end
  end
end
