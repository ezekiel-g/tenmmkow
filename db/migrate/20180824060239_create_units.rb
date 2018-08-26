class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.string :name, null: false
      
      t.belongs_to :army

      t.timestamps null: false
    end
  end
end
