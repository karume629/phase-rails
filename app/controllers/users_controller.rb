class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :handle_blank_field

    def index
        render json: User.all, status: :ok
    end

    def show
        user = User.find(params[:id])

        if user
            render json: user, status: :ok
        else
            render json: { error: "Not authorized" }, status: :unauthorized
        end
    end

    def create
        user = User.create!(user_params)
        if user.valid?
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        user = User.find_by(id: params[:id])
        
        if user
            user.update(user_params)
            render json: user, status: :accepted
        else
            render json: {error: "user not found"}
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        if user
            user.destroy
            head :no_content
        else
            render json: {error: "User not found"}
        end
    end
    

    private

    def user_params
        params.permit(:username, :pic, :password, :email)
    end

    def handle_blank_field(invalid)
        render json: {error: invalid.record.errors}, status: :unprocessable_entity
    end
end
