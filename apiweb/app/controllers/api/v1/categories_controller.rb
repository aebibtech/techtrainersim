class Api::V1::CategoriesController < ApiController
    def index
        @categories = Category.all.order("created_at DESC")
        render json: @categories
    end

    def show
        begin
            @category = Category.find(params[:id])
            render json: @category
        rescue
            render json: { message: "Not found", status: 404 }, status: 404
        end
    end

    def create
        @category = Category.new(category_name: params[:category_name])
        if @category.save
            render json: @category
        else
            render json: { errors: @category.errors.full_messages }, status: 400
        end
    end

    def update
        to_update = Category.find(params[:id])
        if to_update != nil
            to_update.category_name = params[:category_name]
            if to_update.save
                head 204
            else
                render json: { errors: to_update.errors.full_messages }, status: 400
            end
        else
            render json: { message: "Not found", status: 404 }, status: 404
        end
    end
end
