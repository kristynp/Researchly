class DropJournalsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :journals
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
