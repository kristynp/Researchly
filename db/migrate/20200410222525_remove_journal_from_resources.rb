class RemoveJournalFromResources < ActiveRecord::Migration[6.0]
  def change
    remove_column :resources, :journal, :string
  end
end
