class CreateFieldings < ActiveRecord::Migration[5.2]
  def change
    create_table :fieldings do |t|
      t.belongs_to :user
      t.belongs_to :unit

      t.timestamps null: false
    end
  end
end
