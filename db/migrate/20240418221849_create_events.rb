class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.datetime :event_start
      t.datetime :event_end
      t.string :location
      t.string :category
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
