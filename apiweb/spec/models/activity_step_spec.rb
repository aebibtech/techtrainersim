require 'rails_helper'

RSpec.describe ActivityStep, type: :model do
    context "with valid attributes" do
        it "should create a new activity step" do
            expect(build(:activity_step)).to be_valid
        end
    end
    context "with invalid attributes" do
        it "should not create a new activity step if activity is blank" do
            expect(build(:activity_step, activity: nil)).to be_invalid
        end
        it "should not create a new activity step if step name is blank" do
            expect(build(:activity_step, step_name: "")).to be_invalid
        end
        it "should not create a new activity step if step name is less than 2 characters" do
            expect(build(:activity_step, step_name: "a")).to be_invalid
        end
        it "should not create a new activity step if step description is blank" do
            expect(build(:activity_step, step_description: "")).to be_invalid
        end
        it "should not create a new activity step if step number is invalid" do
            expect(build(:activity_step, step_number: "")).to be_invalid
            expect(build(:activity_step, step_number: "garbage")).to be_invalid
            expect(build(:activity_step, step_number: -1)).to be_invalid
        end
        it "should not create a new activity step if step image is not valid" do
            expect(build(:activity_step, step_image: "")).to be_invalid
            expect(build(:activity_step, step_image: "virus.exe")).to be_invalid
        end
    end
end
