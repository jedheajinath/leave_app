class CreateLeaves < ActiveRecord::Migration
  def change
    create_table :leaves do |t|
      t.date :from_date
      t.date :to_date
      t.text :reason
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
