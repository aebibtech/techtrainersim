class Api::V1::UsersController < ApiController
    def show
        user = User.find_by_username(params[:username])
        if user != nil
            @to_render = {
                username: user.username,
                bio: user.bio,
                stars: user.stars,
                last_failed_login: user.last_failed_login,
                created_at: user.created_at,
                updated_at: user.updated_at
            }
            render json: @to_render
        else
            head 404
        end
    end

    def learning_progresses
        @user = User.find_by_username(params[:username])
        if @user != nil
            @learning_progresses = LearningProgress.where(user: @user).order("updated_at DESC")
            render json: @learning_progresses
        else
            head 404
        end
    end

    def create
        create_params = {
            username: params[:username],
            password: params[:password],
            bio: "",
            stars: 0,
            user_level: 1,
            last_failed_login: nil
        }
        @user = User.new(create_params)
        if @user.save
            create_params.delete(:password)
            create_params[:id] = @user.id
            render json: create_params
        else
            render json: { errors: @user.errors.full_messages }
        end
    end

    def update_bio
        @user = User.find_by_username(params[:username])
        if @user != nil
            @user.update_attribute("bio", params[:bio])
        else
            head 404
        end
    end

    def update_stars
        @user = User.find_by_username(params[:username])
        if @user != nil
            @user.update_attribute("stars", params[:stars])
        else
            head 404
        end
    end

    def login
        @result = User.login(params[:username], params[:password])
        if @result.kind_of? String
            render json: { error: @result }
        else
            render json: @result.username
        end
    end
end
