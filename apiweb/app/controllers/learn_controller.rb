class LearnController < ApplicationController
    def index
        @user = User.find_by_username(session[:username]) if session[:username] != nil
        @categories = Category.all
    end

    def learning_activity
        @user = User.find_by_username(session[:username]) if session[:username] != nil
    end
end
