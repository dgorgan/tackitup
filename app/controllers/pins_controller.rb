class PinsController < ApplicationController
    def index
      @pins = Pin.all
    end

    def new
      @pin = Pin.new
    end

    def create
      @pin = current_user.pins.create!(pin_params)
      redirect_to pins_path
    end

    def show
      @pin = Pin.find(params[:id])
    end

    def edit
      @pin = Pin.find(params[:id])
      if current_user.id != @pin.user_id
        redirect_to pin_path(@pin)
      end
    end

    def update
      @pin = Pin.find(params[:id])
      @pin.update(pin_params)
      redirect_to pin_path(@pin)
    end

    def destroy
      @pin = Pin.find(params[:id])
        if current_user.id != @pin.user_id
          redirect_to pins_path
        end
      @pin.destroy!
      redirect_to pins_path
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
