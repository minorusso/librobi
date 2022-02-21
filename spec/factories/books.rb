FactoryBot.define do
    factory :book, class: Book do
        title { "七日七夜" }
        author { "大塚 優花" }
        isbn  { "9784101235288" }
        url { 'https://books.rakuten.co.jp/rb/16343869/' }
        image_url { "" }
        item_caption { "インドのデリーからイギリスのロンドンまで、乗合いバスで行ってみたいー。ある日そう思い立った２６歳" }
    end

end