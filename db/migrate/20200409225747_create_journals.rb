class CreateJournals < ActiveRecord::Migration[6.0]
  def change
    create_table :journals do |t|
      t.string :name
      t.string :website
      t.boolean :open_source

      t.timestamps
    end
  end
end
