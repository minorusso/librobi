require 'rails_helper'
RSpec.describe 'お気に入り機能', type: :system do 
    let!(:user) { FactoryBot.create(:user) }
    let!(:book) { FactoryBot.create(:book) }
    describe 'お気に入り機能' do
        before do
            visit new_user_session_path
            fill_in 'user[email]',with: user.email
            fill_in 'user[password]',with: user.password
            click_button 'ログイン'
            find(".form-control").set("深夜特急")
            click_button '検索'
            click_on '詳細へ', match: :first
            click_on 'レビューを作成する'
            find('#star').find("img[alt='4']").click
            find("#review").set("面白かったです。")
            click_on '投稿する'
            click_on '詳細', match: :first
        end
        context 'いいねを押すと' do
            it 'カウントが1増える' do
                find(".favorite_btn").click
                sleep 1
                expect(page).to have_content (1)
            end
        end
    end
end