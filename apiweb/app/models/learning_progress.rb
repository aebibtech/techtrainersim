class LearningProgress < ApplicationRecord
    belongs_to :user
    belongs_to :activity

    # Validations
    validates :user, :activity, presence: true
    validates :current_step, presence: true, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 1 }
end
