module UsersHelper
    def self.ensure_logged_in
        if session[:username] != nil
            yield
        else
            redirect_to "u/login"
        end
    end

    def self.check_logged_in
        if session[:username] != nil
            redirect_to "#{session[:username]}"
        end
    end
end