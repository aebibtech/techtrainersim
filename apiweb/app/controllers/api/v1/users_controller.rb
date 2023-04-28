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
            render json: { error: "User not found", status: 404 }
        end
    end

    def learning_progresses
        @user = User.find_by_username(params[:username])
        if @user != nil
            @learning_progresses = LearningProgress.where(user: @user).order("updated_at DESC")
            render json: @learning_progresses.as_json
        else
            render json: { error: "User not found", status: 404 }
        end
    end

    def update_learning_progress
        @user = User.find(params[:user_id])
        @act = Activity.find(params[:activity_id])
        completion = false
        reward = 0
        if @user != nil
            @learn_prog = LearningProgress.find_by(user: @user, activity: @act)
            if params[:current_step].to_i > @learn_prog.current_step
                @learn_prog.current_step = params[:current_step].to_i
                if @learn_prog.current_step == @learn_prog.activity.activity_steps.length
                    @learn_prog.is_completed = true
                    @user.update_attribute("stars", @user.stars + @learn_prog.activity.reward)
                end
                @learn_prog.save
                @learn_prog.reload
                if @learn_prog.is_completed
                    completion = true
                    reward = @learn_prog.activity.reward
                end
            end
            render json: { completed: completion, reward: reward }
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
            render json: { status: 'success' }
        else
            render json: { errors: @user.errors.full_messages.join(" ") }
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
            @user.update_attribute("stars", @user.stars + params[:stars].to_i)
        else
            head 404
        end
    end

    def login
        @result = User.login(params[:username], params[:password])
        if @result.kind_of? String
            render json: { error: @result }
        else
            render json: { data: @result.as_json, status: 'success' }
        end
    end

    def account_recovery
    end

    def change_password
    end
end
