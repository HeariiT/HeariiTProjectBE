class SongSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :attachment
end
