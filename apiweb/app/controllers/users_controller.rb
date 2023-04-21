require_relative './modules/users_helper'

class UsersController < ApplicationController
    include UsersHelper
    def index
        render layout: "application"
    end
    
    def login
    end

    def process_login
    end

    def register
    end

    def process_register
    end

    def profile
    end

    def forgot_password
    end

    def process_forgot_password
    end

    def logout
        session.clear
        redirect_to "/"
    end
end
