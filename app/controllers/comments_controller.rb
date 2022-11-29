class CommentsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :handle_blank_field

    def index
        render json: Comment.all, status: :ok
    end

    def show
        comment = Comment.find_by(id: params[:id])

        if comment
            render json: comment, status: :found
        else
            render json: { error: "Comment does not exist" }, status: :unprocessable_entity
        end
    end

    def create
        comment = Comment.create!(comment_params)
        if comment.valid?
            render json: comment, status: :created
        else
            render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        comment = Comment.find_by(id: params[:id])
        
        if comment
            comment.update(comment_params)
            render json: comment, status: :accepted
        else
            render json: {error: "Comment not found"}
        end
    end

    def destroy
        comment = Comment.find_by(id: params[:id])
        if comment
            comment.destroy
            head :no_content
            render json: {success: "Comment deleted successfully"}
        else
            render json: {error: "Comment not found"}
        end
    end
    

    private

    def comment_params
        params.permit(:comment, :pet_id, :user_id)
    end

    def handle_blank_field(invalid)
        render json: {error: invalid.record.errors}, status: :unprocessable_entity
    end
end
