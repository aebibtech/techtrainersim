class ActivityStep < ApplicationRecord
    belongs_to :activity
    has_one_attached :image, dependent: :destroy

    # Validations
    # VALID_IMAGE_REGEX = /^.+\.(jpg|jpeg|png|gif|bmp)$/
    validates :step_name, :step_description, presence: true, length: { minimum: 2 }
    # validates :step_number, presence: true, numericality: { only_integer: true }, comparison: { greater_than: 0 }
    # validates :step_image, presence: true, format: { with: VALID_IMAGE_REGEX, multiline: true }
end
