class Activity < ApplicationRecord
    belongs_to :category
    has_many :activity_steps, dependent: :destroy
    has_many :learning_progresses, dependent: :destroy
    has_one_attached :image, dependent: :destroy
    
    # Validations
    VALID_IMAGE_REGEX = /^.+\.(jpg|jpeg|png|gif|bmp)$/
    validates :activity_name, :description, presence: true, length: { minimum: 3 }
    # validates :activity_image, format: { with: VALID_IMAGE_REGEX, multiline: true }
    validates :reward, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
end
