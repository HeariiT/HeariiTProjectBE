class AddPictureToCovers < ActiveRecord::Migration[5.1]
  def change
    add_column :covers, :picture, :string
  end
end
