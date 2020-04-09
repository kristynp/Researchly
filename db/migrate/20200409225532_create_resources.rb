class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.string :title
      t.string :journal
      t.string :key_topics
      t.integer :research_goal_id
      t.integer :journal_id

      t.timestamps
    end
  end
end
