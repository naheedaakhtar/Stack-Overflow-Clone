class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :parent_reply, class_name: "Reply", optional: true
  has_many :replies, foreign_key: :parent_reply_id, class_name: "Reply", dependent: :destroy
end
