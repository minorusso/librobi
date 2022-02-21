# require 'rails_helper'
# RSpec.describe 'タスクモデル機能', type: :model do
#     describe '本のisbnがないと' do
#         it 'バリデーションにひっかる' do
#             book = Book.new(title: 'タイトル', isbn: '')
#             expect(book).not_to be_valid
#         end
#     end

#     context 'タスクの詳細が空の場合' do
#       it 'バリデーションにひっかかる' do
#         task = Task.new(title: '失敗テスト', details: ' ')
#         expect(task).not_to be_valid
#       end
#     end
#     context '終了期限がない場合' do
#       it 'バリデーションに引っかかる' do 
#         task = Task.new(title:'失敗テスト', time_limit:'')
#         expect(task).not_to be_valid
#       end
#     end
#     context 'ステータスがない場合' do
#       it 'バリデーションに引っかかる' do 
#         task = Task.new(title:'失敗テスト',completed:'')
#         expect(task).not_to be_valid
#       end
#     end
#     context 'タスクのタイトル・詳細・終了期限・ステータス・優先度がある場合' do
#       it 'バリデーションが通過する' do
#         task = Task.new(title:'成功タイトル名',details:'成功詳細',time_limit:'2000-01-01',completed:'完了',priority:'高')
#         expect(task).to be_valid
#       end
#     end
#     context '優先度がない場合' do
#       it 'バリデーションに引っかかる' do
#         task = Task.new(title:'失敗テスト',priority:'')
#         expect(task).not_to be_valid 
#       end
    # end