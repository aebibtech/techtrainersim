class CreateLearningProgresses < ActiveRecord::Migration[7.0]
  def change
    create_table :learning_progresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true
      t.integer :current_step
      t.boolean :is_completed

      t.timestamps
    end
  end
end
