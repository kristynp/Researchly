class CreateResourceNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :resource_notes do |t|
      t.string :title
      t.string :content
      t.integer :resource_id

      t.timestamps
    end
  end
end
