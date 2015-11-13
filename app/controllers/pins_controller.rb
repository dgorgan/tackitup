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

    end

    def edit
    end

    def update
    end

    def destroy
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
