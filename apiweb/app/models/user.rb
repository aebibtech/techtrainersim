class User < ApplicationRecord
    has_secure_password
    has_many :learning_progresses, dependent: :destroy
    
    # Validations
    USERNAME_REGEX = /^[^0-9\s][a-zA-Z0-9_-]{3,15}$/
    PASSWORD_REGEX = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\w\s]).{8,}$/
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 6 }, format: { with: USERNAME_REGEX, multiline: true }
    validates :password, presence: true, format: { with: PASSWORD_REGEX, multiline: true }

    def self.login username, password
        return "Username or password can't be blank" if username.blank? || password.blank?
        error_message = "Invalid username or password"
        user = find_by_username(username)
        if user != nil
            result = user.authenticate(password)
            if result
                return result
            else
                user.update_attribute("last_failed_login", DateTime.now)
                return error_message
            end
        else
            return error_message
        end
    end
end
