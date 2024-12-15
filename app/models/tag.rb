class Tag < ApplicationRecord
    has_one_attached :icon do |icon|
        icon.variant :thumb, resize_to_limit: [ 80, 80 ]
        icon.variant :medium, resize_to_limit: [ 240, 240 ]
    end

    has_and_belongs_to_many :posts

    def self.approved
        Tag.find_by(name: "Instructor Response")
    end

    def self.choosable_tags
        Tag.where.not(name: "Instructor Response")
    end

    def self.tagNames
        Tag.all.distinct.pluck(:name)
    end
end
