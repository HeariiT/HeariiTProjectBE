class Song < ApplicationRecord
	mount_uploader :attachment, AttachmentUploader
	validates :user_id, presence: true
end
