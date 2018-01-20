class RemoveColumnsFromEntry < ActiveRecord::Migration
  def change
    remove_column :entries, :cat_id
    remove_column :entries, :status_id
  end
end
