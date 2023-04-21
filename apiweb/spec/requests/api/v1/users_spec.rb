require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "GET /api/vi/users" do
    it "returns http success" do
      get "/api/v1/users"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /api/v1/users/:username" do
    it "returns http success" do
      get "/api/v1/users/aebibtech"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      post "/api/v1/users/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/v1/users/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /login" do
    it "returns http success" do
      get "/api/v1/users/login"
      expect(response).to have_http_status(:success)
    end
  end

end
