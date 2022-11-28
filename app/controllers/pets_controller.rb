class PetsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :handle_blank_field

    def index
        render json: Pet.all, status: :ok
    end

    def show
        pet = Pet.find_by(id: params[:id])

        if pet
            render json: pet, status: :found
        else
            render json: { error: "Pet does not exist" }, status: :unprocessable_entity
        end
    end

    def create
        pet = Pet.create!(pet_params)
        if pet.valid?
            render json: pet, status: :created
        else
            render json: { errors: pet.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        pet = Pet.find_by(id: params[:id])
        
        if pet
            pet.update(pet_params)
            render json: pet, status: :accepted
        else
            render json: {error: "Pet not found"}
        end
    end

    def destroy
        pet = Pet.find_by(id: params[:id])
        if pet
            pet.destroy
            head :no_content
            render json: {success: "Pet deleted successfully"}
        else
            render json: {error: "Pet not found"}
        end
    end
    

    private

    def pet_params
        params.permit(:name, :description, :image, :likes, :user_id)
    end

    def handle_blank_field(invalid)
        render json: {error: invalid.record.errors}, status: :unprocessable_entity
    end
end
