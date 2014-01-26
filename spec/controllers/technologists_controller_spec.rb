require 'spec_helper'

describe TechnologistsController do

  describe "GET 'show'" do
    it "returns http success" do
      get :show, format: 'json', id: 1
      expect(response).to be_success
    end
  end

  describe "POST 'create'" do
    let(:technologist){ FactoryGirl.attributes_for(:user) }

    it "returns http success" do
      expect {
       post :create, format: :json, technolgoist: technologist
      }.to change(User, :count).by(1)
    end
  end

end
