class Api::V1::ActivitiesController < ApplicationController
    def index
        @activities = Activity.all
        @activities_return = []
        @activities.each do |activity|
            @activities_return.push({
                id: activity.id,
                category: activity.category,
                activity_name: activity.activity_name,
                description: activity.description,
                activity_image: activity.activity_image,
                reward: activity.reward,
                activity_steps: activity.activity_steps,
                created_at: activity.created_at,
                updated_at: activity.updated_at
            })
        end if @activities.length > 0
        render json: @activities_return
    end

    def show
        begin
            @activity = Activity.find(params[:id])
            render json: {
                id: @activity.id,
                category: @activity.category,
                activity_name: @activity.activity_name,
                description: @activity.description,
                activity_image: @activity.activity_image,
                reward: @activity.reward,
                activity_steps: @activity.activity_steps,
                created_at: @activity.created_at,
                updated_at: @activity.updated_at
            }
        rescue
            render json: { message: "Not found", status: 404 }, status: 404
        end
    end

    def create
        to_create = {
            category: Category.find(params[:category_id]),
            activity_name: params[:activity_name],
            description: params[:description],
            activity_image: params[:activity_image],
            reward: params[:reward]
        }
        @activity = Activity.new(to_create)
        if @activity.save
            render json: @activity
        else
            render json: { errors: @activity.errors.full_messages }, status: 400
        end
    end

    def update
        
    end
end
