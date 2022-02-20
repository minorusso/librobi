class Post < ApplicationRecord
    belongs_to :user
    belongs_to :book
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    validates :review, presence: true, length:{ maximum:140}
    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end
