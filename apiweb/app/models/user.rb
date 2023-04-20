class User < ApplicationRecord
    has_secure_password
    USERNAME_REGEX = /^[^0-9\s][a-zA-Z0-9_-]{3,15}$/
    PASSWORD_REGEX = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\w\s]).{8,}$/
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 6 }, format: { with: USERNAME_REGEX, multiline: true }
    validates :password, presence: true, format: { with: PASSWORD_REGEX, multiline: true }
end
