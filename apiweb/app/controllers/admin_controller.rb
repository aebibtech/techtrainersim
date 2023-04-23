class AdminController < ApplicationController
    layout "dashboard"
    def index
        if session[:username] != nil
            redirect_to "/activities"
        else
            render layout: "admin"
        end
    end

    def process_login
        if session[:username] != nil
            redirect_to "/activities"
        else
            result = User.login(params[:username], params[:password])
            if result.kind_of? String
                flash[:error] = result
                redirect_to "/admin"
            else
                if result.user_level == 9
                    session[:username] = result.username
                    redirect_to "/activities"
                else
                    session.clear
                    redirect_to "/admin"
                end
            end
        end
    end

    def categories
        is_logged_in do
            @categories = Category.all
        end
    end

    def show_category
        is_logged_in do
            @category = Category.find(params[:id])
        end
    end

    def new_category
        is_logged_in {}
    end

    def create_category
        is_logged_in do
            @category = Category.new(category_name: params[:category_name])
            if @category.save
                flash[:success] = "Category added sucessfully"
            else
                flash[:errors] = @category.errors.full_messages
            end
            redirect_to "/categories/new"
        end
    end

    def edit_category
        is_logged_in do
            begin
                @category = Category.find(params[:id])
            rescue
                redirect_to "/categories"
            end
        end
    end

    def update_category
        is_logged_in do
            begin
                @category = Category.find(params[:id])
                @category.category_name = params[:category_name]
                if @category.save
                    flash[:success] = "Category updated sucessfully"
                else
                    flash[:errors] = @category.errors.full_messages
                end
                redirect_to "/categories/#{@category.id}/edit"
            rescue
                redirect_to "/categories"
            end
        end
    end

    def delete_category
        begin
            @category = Category.find(params[:id])
            @category.destroy
        rescue
        end
        redirect_to "/categories"
    end

    def activities
        is_logged_in do
            @activities = Activity.all
        end
    end

    def show_activity
        is_logged_in do
            @activity = Activity.find(params[:id])
        end
    end

    def new_activity
        is_logged_in do
            @categories = Category.all
        end
    end

    def create_activity
        is_logged_in do
            create_params = {
                activity_name: params[:activity_name],
                description: params[:description],
                reward: params[:reward],
                category: Category.find(params[:category_id]),
                image: params[:image]
            }
            @activity = Activity.new(create_params)
            if @activity.save
                redirect_to "/activities/#{@activity.id}/view"
            else
                flash[:errors] = @activity.errors.full_messages
                redirect_to "/activities/new"
            end
        end
    end

    def edit_activity
        is_logged_in do
            begin
                @activity = Activity.find(params[:id])
                @categories = Category.all
            rescue
                redirect_to "/activities"
            end
        end
    end

    def update_activity
        is_logged_in do
            begin
                @activity = Activity.find(params[:id])
                @activity.activity_name = params[:activity_name]
                @activity.description = params[:description]
                @activity.category = Category.find(params[:category_id])
                @activity.reward = params[:reward]
                @activity.image.attach(params[:image]) if params[:image]
                if @activity.save
                    redirect_to "/activities/#{@activity.id}/view"
                else
                    flash[:errors] = @activity.errors.full_messages
                    redirect_to "/activities/#{params[:id]}/edit"
                end
            rescue
                redirect_to "/activities"
            end
        end
    end

    def delete_activity
        begin
            @activity = Activity.find(params[:id])
            @activity.destroy
        rescue
        end
        redirect_to "/activities"
    end

    def new_activity_step
        is_logged_in do
            @activity = Activity.find(params[:id])
        end
    end

    def create_activity_step
        is_logged_in do
            activity = Activity.find(params[:id])
            next_step_number = activity.activity_steps.maximum('step_number') ? activity.activity_steps.maximum('step_number').to_i + 1 : "1"
            create_params = {
                step_name: params[:step_name],
                step_description: params[:description],
                step_number: next_step_number,
                activity: activity,
                image: params[:image]
            }
            @activity_step = ActivityStep.new(create_params)
            if @activity_step.save
                redirect_to "/activities/#{params[:id]}/view"
            else
                flash[:errors] = @activity_step.errors.full_messages
                redirect_to "/activities/#{params[:id]}/steps/new"
            end
        end
    end

    def edit_activity_step
        is_logged_in do
            begin
                @as = ActivityStep.find(params[:id])
            rescue
                redirect_to "/activities"
            end
        end
    end

    def update_activity_step
        is_logged_in do
            begin
                @as = ActivityStep.find(params[:id])
                @as.step_name = params[:step_name]
                @as.step_number = @as.step_number
                @as.step_description = params[:description]
                @as.image.attach(params[:image]) if params[:image]
                if @as.save
                    flash[:success] = "Step updated successfully"
                else
                    flash[:errors] = @as.errors.full_messages
                end
                redirect_to "/activitysteps/#{@as.id}"
            rescue
                redirect_to "/activities"
            end
        end
    end

    def delete_activity_step
        is_logged_in do
            begin
                @as = ActivityStep.find(params[:id])
                act_id = @as.activity.id
                @as.destroy
                redirect_to "/activities/#{act_id}/view"
            rescue
                redirect_to "/activities"
            end
        end
    end

    def logout
        session.clear
        redirect_to "/admin"
    end

    private
        def is_logged_in
            if session[:username] != nil
                yield
            else
                redirect_to "/admin"
            end
        end
end
