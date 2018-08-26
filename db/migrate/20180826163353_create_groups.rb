class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name, null: false, unique: true
      t.text :description
      t.integer :owner_id, null: false

      t.timestamps null: false
    end
  end
end
