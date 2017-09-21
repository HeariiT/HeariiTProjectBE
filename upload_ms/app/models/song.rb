class Song < ApplicationRecord
	mount_uploader :attachment, AttachmentUploader
	validates :user_id, 	presence: true
	validates :attachment,	presence: true
end
