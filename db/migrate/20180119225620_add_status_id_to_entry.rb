class AddStatusIdToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :status_id, :integer
  end
end
