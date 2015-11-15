class PinsController < ApplicationController
    def index
      @pins = Pin.all
    end

    def new
      @board = Board.find(params[:board_id])
      @pin = @board.pins.new
    end

    def create
      @board = Board.find(params[:board_id])
      @pin = @board.pins.create!(pin_params.merge(user: current_user))
      redirect_to board_path(@board)
    end

    def show
      @board = Board.find(params[:board_id])
      @pin = Pin.find(params[:id])
    end


    def edit
      @board = Board.find(params[:board_id])
      @pin = Pin.find(params[:id])
    end

    def update
      @board = Board.find(params[:board_id])
      @pin = Pin.find(params[:id])
      @pin.update(pin_params)
      redirect_to board_pin_path(@board, @pin)
    end

    def destroy
      @board = Board.find(params[:board_id])
      @pin = Pin.find(params[:id])
      @pin.destroy!
      redirect_to board_path(@board)
    end

    private
    def pin_params
      params.require(:pin).permit(:title, :image_url)
    end

end

# root GET    /                              pins#index
#                  pins GET    /pins(.:format)                pins#index
#                       POST   /pins(.:format)                pins#create
#               new_pin GET    /pins/new(.:format)            pins#new
#              edit_pin GET    /pins/:id/edit(.:format)       pins#edit
#                   pin GET    /pins/:id(.:format)            pins#show
#                       PATCH  /pins/:id(.:format)            pins#update
#                       PUT    /pins/:id(.:format)            pins#update
#                       DELETE /pins/:id(.:format)            pins#destroy
