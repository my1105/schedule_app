class CreateSchedules < ActiveRecord::Migration[7.2]
  def change
    create_table :schedules do |t|
      t.string :title, null: false
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.text :memo

      t.timestamps
    end
  end
end
