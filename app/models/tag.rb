class Tag < ApplicationRecord
    has_one_attached :icon do |icon| 
        icon.variant :thumb, resize_to_limit: [80,80]
        icon.variant :medium, resize_to_limit: [240,240]
    end
end
