require 'rails_helper'

RSpec.describe Category, type: :model do
    context "with valid attributes" do
        it "should create a new category" do
            expect(build(:category)).to be_valid
        end
    end

    context "with invalid attributes" do
        it "should not create a new category with special characters" do
            expect(build(:category, category_name: "!!!!!!")).to be_invalid
        end
    end
end
