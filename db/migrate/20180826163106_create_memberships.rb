class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.belongs_to :user
      t.belongs_to :army
      t.belongs_to :group
      t.text :units_allowed, default: 'all'
      t.integer :rp, numericality: true
      t.text :list

      t.timestamps null: false
    end
  end
end
