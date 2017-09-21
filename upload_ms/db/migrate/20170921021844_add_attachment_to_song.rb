class AddAttachmentToSong < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :attachment, :string
  end
end
