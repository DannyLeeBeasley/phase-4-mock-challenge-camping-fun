class CampersController < ApplicationController
    wrap_parameters status: []

    def index
        campers = Camper.all 
        render json: campers, status: :ok
    end

    def show
        camper = Camper.find_by(id: params[:id])
        if camper
            render json: camper, status: :ok
        else
            render json: {"error": "Camper not found"}, status: :not_found
        end
    end

    def create
        camper = Camper.create(camper_params)
        if camper.valid?
            render json: camper, status: :created
        else
            render json: {"errors": ["validation errors"]}, status: :unprocessable_entity
        end
    end 

    private

    def camper_params 
        params.permit(:id, :name, :age, :activities)
    end

end
