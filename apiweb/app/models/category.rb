class Category < ApplicationRecord
    has_many :activities, dependent: :destroy

    # Validations
    CATEGORY_NAME_NO_SPECIAL_REGEX = /^[a-zA-Z0-9 ]+$/
    validates :category_name, presence: true, length: { minimum: 2 }, format: { with: CATEGORY_NAME_NO_SPECIAL_REGEX, multiline: true }
end
