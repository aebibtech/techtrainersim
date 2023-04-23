class UsersController < ApplicationController
    layout "learn"

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
        is_logged_in do
            @user = User.find_by_username(params[:username])
        end
    end

    def process_register
        user = User.new(username: params[:rusername], password: params[:rpassword], bio: "", stars: 0)
        if user.save
            session[:username] = user.username
            render json: { success: "Registration is successful" }
        else
            render json: { errors: user.errors.full_messages }
        end
    end

    def account_settings
        is_logged_in do
            @user = User.find_by_username(params[:username])
        end
    end

    def update_account_settings
        is_logged_in do
            begin
                @user = User.find_by_username(params[:username])
                @user.update_attribute("bio", params[:bio])
                flash[:success] = "Account updated successfully"
                redirect_to "/#{params[:username]}/settings"
            rescue
                redirect_to "/#{params[:username]}/settings"
            end
        end
    end

    def forgot_password1
    end

    def find_account
        if params[:recusername] == nil || params[:recusername].blank?
            flash[:error] = "Username can't be blank"
            redirect_to "/u/recover"
            return
        end
        @user = User.find_by_username(params[:recusername])
        if @user != nil
            session[:user_id] = @user.id
            redirect_to "/u/new_password"
        else
            flash[:error] = "Username \"#{params[:recusername]}\" was not found"
            redirect_to "/u/recover"
        end
    end

    def forgot_password2
    end

    def process_forgot_password
        if params[:nfpassword] == params[:cfpassword]
            begin
                user = User.find(params[:user_id])
                user.password = params[:nfpassword]
                if user.save
                    session[:username] = user.username
                    redirect_to "/learn"
                else
                    flash[:errors] = user.errors.full_messages
                    redirect_to "/u/new_password"
                end
            rescue
                redirect_to "/"
            end
        else
            flash[:errors] = ["New Password and Confirm New Password must match"]
            redirect_to "/u/new_password"
        end
    end

    def update_password
        begin
            user = User.find_by_username(session[:username])
            result = User.login(user.username, params[:opassword])
            if result.kind_of? String
                render json: { errors: ["Invalid password"] }
            else
                if params[:npassword] == params[:cpassword]
                    user.password = params[:npassword]
                    if user.save
                        render json: { success: "Password changed successfully" }
                    else
                        render json: { errors: user.errors.full_messages }
                    end
                else
                    render json: { errors: ["New Password and Confirm New Password must match"] }
                end
            end
        rescue
            redirect_to "/"
        end
    end

    def logout
        session.clear
        redirect_to "/"
    end

    private
        def is_logged_in
            if session[:username] != nil
                yield
            else
                redirect_to "/"
            end
        end
end
