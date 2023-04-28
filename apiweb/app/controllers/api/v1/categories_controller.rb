class Api::V1::CategoriesController < ApiController
    def index
        @categories = Category.all.order("created_at " + (params[:order] == "DESC" ? "DESC" : "ASC"))
        @categories_return = []
        @categories.each do |category|
            @categories_return.push({
                id: category.id,
                category_name: category.category_name,
                created_at: category.created_at,
                updated_at: category.updated_at,
                activities: category.activities.map { |act| act.as_json.merge(image_path: url_for(act.image)) }
            })
        end if @categories.length > 0
        render json: @categories_return
    end

    def show
        begin
            @category = Category.find(params[:id])
            render json: { category_name: @category.category_name, activities: @category.activities }
        rescue
            render json: { message: "Not found", status: 404 }
        end
    end
end
