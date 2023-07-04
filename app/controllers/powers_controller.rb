class PowersController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:update]

    def index
        render json: Power.all, except: [:created_at, :updated_at]
    end

    def show
        power = Power.find_by(id: params[:id])
        if power
            render json: power, except: [:created_at, :updated_at]
        else
            render json: { message: "Power not found" }, status: :not_found
        end
    end

    def update
        power = Power.find_by(id: params[:id])
        if power
            if power.update(power_params)
              render json: power, except: [:created_at, :updated_at]
            else
              render json: { errors: power.errors.full_messages }, status: :unprocessable_entity
            end
          else
            render json: { error: "Power not found" }, status: :not_found
        end
    end

    private

    def power_params
        params.require(:power).permit(:description)
    end
end
