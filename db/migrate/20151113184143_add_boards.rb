class AddBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :title
      t.string :board_image_url
      t.references :user
    end
  end
end
