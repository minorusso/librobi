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





    end
end