class PinsController < ApplicationController
    before_action :set_pin, only: [:edit, :show, :update, :destroy]

    def index
      @pins = Pin.all
    end

    def new
      @board = Board.find(params[:board_id])
      @pin = @board.pins.new
    end

    def create
      @pin = @board.pins.create!(pin_params.merge(user: current_user))
      redirect_to board_path(@board)
    end

    def show
    end


    def edit
    end

    def update
      @pin.update(pin_params)
      redirect_to board_pin_path(@board, @pin)
    end

    def destroy
      @pin.destroy!
      redirect_to board_path(@board)
    end

    private
    def pin_params
      params.require(:pin).permit(:title, :image_url)
    end

    def set_pin
      @board = Board.find(params[:board_id])
      @pin = Pin.find(params[:id])
    end

end
