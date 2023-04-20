class AddStepImageToActivityStep < ActiveRecord::Migration[7.0]
  def change
    add_column :activity_steps, :step_image, :string
  end
end
