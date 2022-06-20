class PlayersController < ApplicationController
    def show
        @player = Player.find(params[:id])
    end

    def index
        @players = Player.all
    end

    def new
        @player = Player.new
    end

    def create
        @player = Player.new(
            params.require(:player).permit(
                :nickname,
                :first_name,
                :last_name,
                :slug
            )
        )
        if @player.save
            redirect_to(@player)
        else
            # byebug
            render :new
        end
    end
end
