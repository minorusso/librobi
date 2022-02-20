require 'rails_helper'

RSpec.describe Post, type: :model do
    # タイトルと製作年と上映時間と映倫区分があれば有効な状態であること
    describe 'バリデーションのテスト' do
        it "is valid with a review, rate" do
            post = Post.new(
                review: '面白かった！',
                rate: 4.5,
                book_id: 1,
                user_id: 1 )
            expect(post).to be_valid
        end
    end
        # タイトルがなければ無効な状態であること
        it "is invalid without a title"
        # 重複したタイトルなら無効な状態であること
        it "is invalid with a duplicate title"
        # タイトルが101文字以上なら無効な状態であること
        it "is invalid with title is 101 or more characters"

end