require 'rails_helper'
RSpec.describe '投稿機能', type: :system do 
    let!(:user) { FactoryBot.create(:user) }
    let!(:book) { FactoryBot.create(:book) }
    describe '書籍検索投稿機能' do
        before do
            visit new_user_session_path
            fill_in 'user[email]',with: user.email
            fill_in 'user[password]',with: user.password
            click_button 'ログイン'
        end
        context '書籍を検索した場合' do
            it '関連した書籍が表示される' do
                find(".form-control").set("深夜特急")
                click_button '検索'
                expect(page).to have_content '深夜特急'
            end
        end
        context '詳細へを押したとき' do
            it '書籍情報を表示する' do
                find(".form-control").set("深夜特急")
                click_button '検索'
                click_on '詳細へ', match: :first
                expect(page).to have_content '書籍情報'
            end
        end
        context 'レビュー作成を押すと' do
            it 'レビュー作成画面が表示される' do
                find(".form-control").set("深夜特急")
                click_button '検索'
                click_on '詳細へ', match: :first
                click_on 'レビューを作成する'
                expect(page).to have_content 'レビュー投稿'
            end
        end
        context '投稿すると' do
            it '投稿一覧画面へ遷移する' do
                find(".form-control").set("深夜特急")
                click_button '検索'
                click_on '詳細へ', match: :first
                click_on 'レビューを作成する'
                find('#star').find("img[alt='4']").click
                find("#review").set("面白かったです。")
                click_on '投稿する'
                expect(page).to have_content '投稿一覧'
            end
        end
        context '空の投稿すると' do
            it 'バリデーションメッセージを表示する' do
                find(".form-control").set("深夜特急")
                click_button '検索'
                click_on '詳細へ', match: :first
                click_on 'レビューを作成する'
                find('#star').find("img[alt='4']").click
                find("#review").set("")
                click_on '投稿する'
                expect(page).to have_content 'レビューを入力してください'
            end
        end
        context '更新すると' do
            it '投稿一覧画面へ遷移する' do
                find(".form-control").set("深夜特急")
                click_button '検索'
                click_on '詳細へ', match: :first
                click_on 'レビューを作成する'
                find('#star').find("img[alt='4']").click
                find("#review").set("面白かったです。")
                click_on '投稿する'
                click_on '詳細', match: :first
                click_on '編集'
                find('#star').find("img[alt='4']").click
                find("#review").set("更新しました。")
                click_on '更新する'
                expect(page).to have_content 'レビュー詳細'
            end
        end
        context '更新の際、140文字以上入力すると' do
            it 'エラーメッセージを表示する' do
                find(".form-control").set("深夜特急")
                click_button '検索'
                click_on '詳細へ', match: :first
                click_on 'レビューを作成する'
                find('#star').find("img[alt='4']").click
                find("#review").set("面白かったです。")
                click_on '投稿する'
                click_on '詳細', match: :first
                click_on '編集'
                find('#star').find("img[alt='4']").click
                find("#review").set("更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。
                                    更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。
                                    更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。")
                click_on '更新する'
                expect(page).to have_content '140字以内で入力してください'
            end
        end
        context '更新の際、140文字以上入力すると' do
            it 'エラーメッセージを表示する' do
                find(".form-control").set("深夜特急")
                click_button '検索'
                click_on '詳細へ', match: :first
                click_on 'レビューを作成する'
                find('#star').find("img[alt='4']").click
                find("#review").set("面白かったです。")
                click_on '投稿する'
                click_on '詳細', match: :first
                click_on '編集'
                find('#star').find("img[alt='4']").click
                find("#review").set("更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。
                                    更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。
                                    更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。更新しました。")
                click_on '更新する'
                expect(page).to have_content '140字以内で入力してください'
            end
        end
        context '削除ボタンを押すと' do
            it 'エラーメッセージを表示する' do
                find(".form-control").set("深夜特急")
                click_button '検索'
                click_on '詳細へ', match: :first
                click_on 'レビューを作成する'
                find('#star').find("img[alt='4']").click
                find("#review").set("面白かったです。")
                click_on '投稿する'
                click_on '詳細', match: :first
                click_on '削除する'
                page.driver.browser.switch_to.alert.accept
            end
        end
    end
end