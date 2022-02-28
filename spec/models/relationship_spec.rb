require 'rails_helper'

RSpec.describe Relationship, type: :model do

    let(:relationship) { FactoryBot.create(:relationship) }
    describe '#create' do
        context "保存できる場合" do
            it "全てのパラメーターが揃っていれば保存できる" do
                expect(relationship).to be_valid
            end
        end
    end
    describe "各モデルとのアソシエーション" do
    let(:association) do
        described_class.reflect_on_association(target)
    end

        context "仮想モデルfollowerとのアソシエーション" do
        let(:target) { :follower }
            it "Followerとの関連付けはbelongs_toであること" do
                expect(association.macro).to  eq :belongs_to
            end
        end
        context "仮想モデルfollowedとのアソシエーション" do
        let(:target) { :followed }
            it "Followedとの関連付けはbelongs_toであること" do
                expect(association.macro).to  eq :belongs_to
            end
        end
    end
end