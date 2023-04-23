class LearnController < ApplicationController
    def index
        @user = User.find_by_username(session[:username]) if session[:username] != nil
        @categories = Category.all
    end

    def learning_activity
        @user = User.find_by_username(session[:username]) if session[:username] != nil
        begin
            @la = Activity.find_by(activity_name: params[:id].split("-").join(" "))
            if @user != nil
                @lp = LearningProgress.find_by(activity: @la, user: @user)
                if @lp == nil
                    LearningProgress.create(activity: @la, user: @user, current_step: 1, is_completed: false)
                end
            end
        rescue
            redirect_to "/learn"
        end
    end

    def update_progress
        @user = User.find_by_username(session[:username])
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
end
