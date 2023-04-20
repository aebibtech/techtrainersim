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
    context "with valid credentials" do
        it "should be able to return the user" do
            user = create(:user)
            expect(User.login(user.username, user.password).username).to eql(user.username)
        end
    end
    context "with invalid credentials" do
        it "should return an error message if the username does not exist" do
            create(:user)
            expect(User.login("aebibtech", "password123")).to eql("Invalid username or password")
        end
        it "should return an error message if the username or password is blank" do
            expect(User.login("aebibtech", "")).to eql("Username or password can't be blank")
            expect(User.login("", "password123")).to eql("Username or password can't be blank")
        end
        it "should return an error message if the password is incorrect" do
            user = create(:user)
            expect(User.login(user.username, "password123")).to eql("Invalid username or password")
        end
    end
end
