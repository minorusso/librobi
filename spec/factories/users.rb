FactoryBot.define do
    factory :test_user, class: User do
        name { "テストユーザー" }
        email { "test@test.com" }
        password  { "password" }
        password_confirmation { "password" }
        admin { 'true' }
    end
    factory :user, class: User do
        name { 'ユーザー1' }
        email{ 'user1@test.com' }
        password { 'password1' }
        admin {  'false'}
    end

    factory :admin_user, class: User do
        name { '管理者' }
        email{ 'user_2@test.com' }
        password { '222222' }
        admin { 'true' }
    end
end