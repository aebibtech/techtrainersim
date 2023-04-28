class Api::V1::ActivitiesController < ApplicationController
    def index
        @activities = Activity.all.joins(:image_attachment)
        render json: @activities.map { |act| act.as_json.merge(image_path: url_for(act.image)) }
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
                activity_steps: @activity.activity_steps.map { |ast| ast.as_json.merge(image_path: url_for(ast.image)) },
                created_at: @activity.created_at,
                updated_at: @activity.updated_at
            }
        rescue
            render json: { message: "Not found", status: 404 }
        end
    end
end
