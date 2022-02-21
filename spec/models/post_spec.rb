require 'rails_helper'

RSpec.describe Post, type: :model do
    describe 'バリデーションのテスト' do
        context 'ポストのレビューが空の場合' do
            it 'バリデーションにひっかる' do
                post = Post.new(review: '', rate: 4.5)
                expect(post).not_to be_valid
            end
        end
        context 'ポストのレートが空の場合' do
            it 'バリデーションにひっかからない' do
                post = FactoryBot.create(:post)
                expect(post).to be_valid
            end
        end
        context 'レビューが140字以上空の場合' do
            it 'バリデーションにひっかかる' do
                expect do 
                    FactoryBot.create(:post_1)
                end.to raise_error( ActiveRecord::RecordInvalid )
            end
        end
    
    
    
    
    
    end
end