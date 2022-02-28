FactoryBot.define do
    factory :post, class: Post do
        association :user
        association :book
        review { 'Factoryで作ったレビュー' }
        rate { 4.5 }
    end
    factory :post_1, class: Post do
        association :user
        association :book
        review { '140字以上のテストです。おはようございます。おはようございます。おはようございます。おはようございます。おはようございます。おはようございます。おはようございます。おはようございます。おはようございます。おはようございます。おはようございます。おはようございます。おはようございます。おはようございます。' }
        rate { 4.5 }
    end
end