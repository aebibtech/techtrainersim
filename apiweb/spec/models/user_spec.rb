require 'rails_helper'

RSpec.describe User, type: :model do
    context "with valid attributes" do
        it "should create a new user" do
            expect(build(:user)).to be_valid
        end
    end
    context "with invalid attributes" do
        it "should not create a new user if the username is blank" do
            expect(build(:user, username: "")).to be_invalid
        end
        it "should not create a new user if the username starts with a number" do
            expect(build(:user, username: "123456admin")).to be_invalid
        end
        it "should not create a new user if the username contains spaces" do
            expect(build(:user, username: "noobmaster 69")).to be_invalid
        end
        it "should not create a new user if the username contains special characters" do
           expect(build(:user, username: "!!!!!!")).to be_invalid 
        end
        it "should not create a new user if the username is already taken" do
            create(:user)
            expect(build(:user)).to be_invalid
        end
        it "should not create a new user if the password is blank" do
            expect(build(:user, password: "")).to be_invalid
        end
        it "should not create a new user if the password is not meeting the password requirements" do
            expect(build(:user, password: "123456")).to be_invalid
            expect(build(:user, password: "noobmaster69")).to be_invalid
            expect(build(:user, password: "Noobmaster69")).to be_invalid
            expect(build(:user, password: "!@#$%^&*")).to be_invalid
        end
    end
end
