require 'rails_helper'

RSpec.describe LearningProgress, type: :model do
    context "with valid attributes" do
        it "should be able to create a new learning progress" do
            expect(build(:learning_progress)).to be_valid
        end
    end
    context "with invalid attributes" do
        it "should not be able to create a new learning progress if user or activity is blank" do
            expect(build(:learning_progress, user: nil)).to be_invalid
            expect(build(:learning_progress, activity: nil)).to be_invalid
        end
        it "should not be able to create a new learning progress if current step is blank" do
            expect(build(:learning_progress, current_step: "")).to be_invalid
        end
        it "should not be able to create a new learning progress if current step is not a number" do
            expect(build(:learning_progress, current_step: "garbage")).to be_invalid
        end
        it "should not be able to create a new learning progress if current step is less than 1" do
            expect(build(:learning_progress, current_step: 0)).to be_invalid
        end
    end
end
