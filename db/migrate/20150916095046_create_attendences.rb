class CreateAttendences < ActiveRecord::Migration
  def change
    create_table :attendences do |t|
      t.date :attendence_date
      t.references :user, index: true, foreign_key: true
      t.boolean :attendence
      t.timestamps null: false
    end
  end
end
