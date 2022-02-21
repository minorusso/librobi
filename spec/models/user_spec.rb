require 'rails_helper'
RSpec.describe 'dvevise機能', type: :model do
    describe '新規会員登録機能' do
        context '名前、メアド、パスワードがある場合' do 
            it 'バリデーションに引っかからない' do
                user = User.new(name: "ユーザー", email: "test@examole.com", password: "password")
                expect(user).to be_valid
            end
        end
        context '名前がない場合' do 
            it 'バリデーションに引っかかる' do
                user = User.new(name: "", email: "test@examole.com", password: "password")
                expect(user).to be_valid
            end
        end
        context 'メアドがない場合' do 
            it 'バリデーションに引っかかる' do
                user = User.new(name: "ユーザー", email: "", password: "password")
                expect(user).not_to be_valid
            end
        end
    end
end
