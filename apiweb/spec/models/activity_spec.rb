require 'rails_helper'

RSpec.describe Activity, type: :model do
    context "with valid attributes" do
        it "should create a new activity" do
            expect(build(:activity)).to be_valid
        end
    end
    context "with invalid attributes" do
        it "should not create a new activity if the category is blank" do
            expect(build(:activity, category: nil)).to be_invalid
        end
        it "should not create a new activity if the activity name is blank" do
            expect(build(:activity, activity_name: "")).to be_invalid
        end
        it "should not create a new activity if the activity description is blank" do
            expect(build(:activity, description: "")).to be_invalid
        end
        it "should not create a new activity if the activity image is not a valid image" do
            expect(build(:activity, activity_image: "virus.exe")).to be_invalid
        end
        it "should not create a new activity if reward is not a number" do
            expect(build(:activity, reward: "garbage")).to be_invalid
        end
        it "should not create a new activity if reward is less than 0" do
            expect(build(:activity, reward: -10)).to be_invalid
        end
    end
end
