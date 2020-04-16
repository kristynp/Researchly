class RemoveJournalIdFromResources < ActiveRecord::Migration[6.0]
  def change
    remove_column :resources, :journal_id, :integer
  end
end
