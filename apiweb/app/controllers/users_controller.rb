require_relative './modules/users_helper'

class UsersController < ApplicationController
    layout "learn"
    include UsersHelper
    def index
        if session[:username] == nil
            render layout: "application"
        else
            redirect_to "/learn"
        end
    end

    def process_login
        result = User.login(params[:username], params[:password])
        if result.kind_of? String
            render json: { error: result }
        else
            session[:username] = result.username
            render json: { username: result.username }
        end
    end

    def profile
        @user = User.find_by_username(session[:username]) if session[:username]
    end

    def process_register
    end

    def account_settings
    end

    def update_account_settings
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
