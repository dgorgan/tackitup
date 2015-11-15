class BoardsController < ApplicationController

  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.create!(board_params)
    redirect_to boards_path
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = Board.find(params[:id])
    if current_user.id != @board.user_id
      redirect_to board_path(@board)
    end
  end

  def update
    @board = Board.find(params[:id])
    @board.update(board_params)
    redirect_to board_path(@board)
  end

  def destroy
    @board = Board.find(params[:id])
      if current_user.id != @board.user_id
        redirect_to boards_path
      end
    @board.destroy!
    redirect_to boards_path
  end


  private
  def board_params
    params.require(:board).permit(:title, :board_image_url)
  end


end
