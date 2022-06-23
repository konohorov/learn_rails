class PlayersController < ApplicationController

    before_action :set_player, only: [:show, :edit, :update, :destroy]

    def show
    end

    def index
        @players = Player.all
    end

    def new
        @player = Player.new
    end

    def edit
    end

    def create
        @player = Player.new(player_params)

        if @player.save
            flash[:notice] = 'Player created'
            redirect_to(@player)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if @player.update(player_params)
            flash[:notice] = 'Player updated'
            redirect_to(@player)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @player.destroy
        redirect_to(players_path)
    end

    private

    def set_player
        @player = Player.find(params[:id])
    end

    def player_params
        params.require(:player).permit(
            :nickname,
            :first_name,
            :last_name,
            :slug)
    end
end
