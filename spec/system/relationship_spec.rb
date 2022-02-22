require 'rails_helper'

RSpec.describe "Relationships", type: :system do
    before do
        @user1 = FactoryBot.create(:user)
        @user2 = FactoryBot.create(:test_user)
    end
    describe '#create,#destroy' do
        it 'ユーザーをフォローできる' do 
            visit new_user_session_path
            fill_in 'user[email]',with: @user1.email
            fill_in 'user[password]',with: @user1.password
            click_button 'ログイン'
            click_on 'ユーザー'
            click_on 'テストユーザー'
            click_on 'フォローする'
            expect(@user1.follower.count).to eq(1)
        end
    end
end