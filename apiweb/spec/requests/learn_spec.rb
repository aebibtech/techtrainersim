require 'rails_helper'

RSpec.describe "Learns", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/learn/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /learning_activity" do
    it "returns http success" do
      get "/learn/learning_activity"
      expect(response).to have_http_status(:success)
    end
  end

end
