require 'rails_helper'
RSpec.describe 'dvevise/ユーザー機能', type: :system do
    describe '新規登録機能' do
        let!(:user){FactoryBot.build(:test_user)}
        before do
            visit new_user_registration_path
            fill_in 'user[name]', with: user.name
            fill_in 'user[email]',with: user.email
            fill_in 'user[password]',with: user.password
            fill_in 'user[password_confirmation]',with:user.password_confirmation
        end
        context '新規会員登録画面でユーザが入力した場合' do 
            it '投稿一覧画面に遷移する' do
                find('.box-login').click
                expect(page).to have_content('投稿一覧') 
            end
        end
        context '新規会員登録画面でログインをクリックした場合' do 
            it 'ログイン画面に遷移する' do
                find('.box-newusr').click
                expect(page).to have_content('ログイン') 
            end
        end
    end
    describe 'セッション機能' do
        before do
            user = FactoryBot.create(:user)
            visit new_user_session_path
            fill_in 'user[email]',with: user.email
            fill_in 'user[password]',with: user.password
        end
        context 'ログイン画面でログインした場合' do 
            it '投稿一覧画面に遷移する' do
                click_button 'ログイン'
                expect(page).to have_content('投稿一覧') 
            end
        end
        context 'ログインした場合'do 
            it 'マイページにアクセスできる' do 
                click_button 'ログイン'
                click_on 'マイページ'
                expect(page).to have_content ('マイページ')
            end
        end
        context 'ログインした場合'do 
            it 'ログアウトできる' do 
                click_button 'ログイン'
                click_on 'ログアウト'
                expect(page).to have_content ('Librobi')
            end
        end
    end
    describe 'ゲスト機能' do
        before do
            user = FactoryBot.create(:admin_user)
            visit new_user_session_path
            fill_in 'user[email]',with: user.email
            fill_in 'user[password]',with: user.password
        end
        context 'トップ画面でゲストログイン（管理者用）をクリックした場合' do 
            it 'ログイン画面に遷移する' do
                click_button 'ゲストログイン（管理者用）'
                expect(page).to have_content('投稿一覧') 
            end
        end
        context 'ゲストログイン（管理者用）でログインした場合' do 
            it '管理者画面画面に遷移できる' do
                click_button 'ゲストログイン（管理者用）'
                click_on '管理者画面'
                expect(page).to have_content('Admin') 
            end
        end
        context 'トップ画面でゲストログイン（一般用）をクリックした場合' do 
            it 'ログイン画面に遷移する' do
                click_button 'ゲストログイン（一般ユーザー用）'
                expect(page).to have_content('投稿一覧') 
            end
        end

    end





    
end