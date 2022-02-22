FactoryBot.define do
    factory :comment, class: Comment do
        association :user
        association :post
        comment { 'テストコメント' }
    end
end