module UsersHelper
    def self.is_logged_in
        if session[:username] != nil
            yield
        end
    end

    def self.check_logged_in
        if session[:username] != nil
            redirect_to "/learn"
        end
    end
end