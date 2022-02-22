require 'rails_helper'
RSpec.describe 'コメント機能', type: :system do 
    let!(:user) { FactoryBot.create(:user) }
    let!(:book) { FactoryBot.create(:book) }
    describe 'コメント機能' do
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
        context 'コメントを投稿すると' do
            it 'コメント一覧に表示される' do
                fill_in "comment[comment]", with: 'Hello!!'
                click_on 'コメントする'
                sleep 5
                expect(page).to have_content 'Hello!!'
            end
        end
        context 'コメントを編集すると' do
            it 'コメント一覧に表示される' do
                fill_in "comment[comment]", with: 'Hello!!'
                click_on 'コメントする'
                click_on 'コメント削除'
                page.driver.browser.switch_to.alert.accept
            end
        end
    end
end