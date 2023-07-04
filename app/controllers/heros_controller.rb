class HerosController < ApplicationController
    
    def index
        render json: Hero.all, except: [:created_at, :updated_at]
    end

    def show
        hero = Hero.find_by(id: params[:id])
        if hero
            render json: hero, except: [:created_at, :updated_at], include: { powers: { except: [:created_at, :updated_at] } }
        else
            render json: { error: 'Hero not found' }, status: :not_found
        end 
    end

end
