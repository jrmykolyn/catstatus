class AddCatIdToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :cat_id, :integer
  end
end
