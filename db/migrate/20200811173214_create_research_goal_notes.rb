class CreateResearchGoalNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :research_goal_notes do |t|
      t.string :title
      t.string :content
      t.integer :research_goal_id

      t.timestamps
    end
  end
end
