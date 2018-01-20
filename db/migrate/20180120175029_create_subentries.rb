class CreateSubentries < ActiveRecord::Migration
  def change
    create_table :subentries do |t|
      t.integer :entry_id
      t.integer :cat_id
      t.integer :status_id

      t.timestamps null: false
    end
  end
end
