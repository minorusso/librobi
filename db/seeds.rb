#Users
15.times do |n|
    name = Faker::Games::Pokemon.name
    email = Faker::Internet.email
    password = "password"
    User.create!(name: name,
                email: email,
                password: password,
                admin: false
                )
end

#Admin User
3.times do |n|
    name = Faker::Games::Pokemon.name
    email = Faker::Internet.email
    password = "password"
    User.create!(name: name,
                email: email,
                password: password,
                admin: true
                )
end

#Books
15.times do |n|
    title = Faker::Book.title
    author = Faker::Book.author
    publishername = "幻冬社"
    isbn = 9784101235288
    url = "https://books.rakuten.co.jp/rb/16343869/"
    image_url = "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/5288/9784101235288.jpg?_ex=120x120"
    item_caption = "インドのデリーからイギリスのロンドンまで、乗合いバスで行ってみたいー。ある日そう思い立った２６歳の“私”は、仕事をすべて投げ出して旅に出た。途中立ち寄った香港では、街の熱気に酔い痴れて、思わぬ長居をしてしまう。マカオでは、「大小」というサイコロ博奕に魅せられ、あわや…。一年以上にわたるユーラシア放浪の旅が今、幕を開けた。いざ、遠路二万キロ彼方のロンドンへ！"
    Book.create!(title: title,
                author: author,
                publishername: publishername,
                isbn: isbn,
                url: url,
                image_url: image_url,
                item_caption: item_caption
                )
end

# #Posts
30.times do |n|
    review = "今月#{n + 1}冊目です。"
    rate = 4.5
    book_id = n + 1
    user_id = n + 1
    Post.create!(review: review,
                rate: rate,
                book_id: book_id,
                user_id: user_id
                )
end

#Comments
10.times do |n|
    comment = "#{n + 1}番目に面白かった？"
    user_id = n + 1
    post_id = n + 1
    Comment.create!(comment: comment,
                user_id: user_id,
                post_id: post_id
                )
end

#Favorites
10.times do |n|
    user_id = n + 1
    post_id = n + 1
    Favorite.create!(user_id: user_id,
                post_id: post_id
                )
end

#Relationships
# users = User.all
# user  = users.first
# following = users[2..15]
# followers = users[3..10]
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) }
