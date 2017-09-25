class Cover < ApplicationRecord
	mount_uploader :picture, PictureUploader
end
