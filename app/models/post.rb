class Post < ApplicationRecord
    belongs_to :user
    has_rich_text :body
    validates :user_id, presence:true
end
