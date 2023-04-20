class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.references :category, null: false, foreign_key: true
      t.string :activity_name
      t.text :description
      t.string :activity_image
      t.integer :reward

      t.timestamps
    end
  end
end
