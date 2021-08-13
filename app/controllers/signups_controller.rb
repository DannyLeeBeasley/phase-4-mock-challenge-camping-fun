class SignupsController < ApplicationController
    wrap_parameters status: []

    def create
        signup = Signup.create(signup_params)
        if signup.valid?
            render json: signup.activity, status: :created
        else
            render json: { "errors": ["validation errors"] }, status: :unprocessable_entity
        end
    end

    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id, )
    end

end
