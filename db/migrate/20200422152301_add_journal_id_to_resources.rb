class AddJournalIdToResources < ActiveRecord::Migration[6.0]
  def change
    add_column :resources, :journal_id, :integer
  end
end
