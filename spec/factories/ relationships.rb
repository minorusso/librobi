FactoryBot.define do
    factory :relationship do
        follower_id    { FactoryBot.create(:user).id }
        followed_id    { FactoryBot.create(:test_user).id }
    end
end