class CreateActivitySteps < ActiveRecord::Migration[7.0]
  def change
    create_table :activity_steps do |t|
      t.references :activity, null: false, foreign_key: true
      t.string :step_name
      t.string :step_description
      t.integer :step_number

      t.timestamps
    end
  end
end
