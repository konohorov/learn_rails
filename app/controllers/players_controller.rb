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

    def edit
        @player = Player.find(params[:id])
    end

    def create
        @player = Player.new(player_params)

        if @player.save
            flash[:notice] = 'Player created'
            redirect_to(@player)
        else
            render :new
        end
    end

    def update
        @player = Player.find(params[:id])
        if @player.update(player_params)
            flash[:notice] = 'Player updated'
            redirect_to(@player)
        else
            render :edit
        end
    end

    def destroy
        @player = Player.find(params[:id])
        @player.destroy
        redirect_to(players_path)
    end

    private

    def player_params
        params.require(:player).permit(
            :nickname,
            :first_name,
            :last_name,
            :slug)
    end
end
