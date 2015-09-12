class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.text :reason
      t.references :user, index: true, foreign_key: true
      t.integer :leave_id
      t.string :status

      t.timestamps null: false
    end
  end
end
