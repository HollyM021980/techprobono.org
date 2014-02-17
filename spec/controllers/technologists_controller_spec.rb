require 'spec_helper'

describe TechnologistsController do

  describe "GET 'show'" do
    it "returns http success" do
      tech = FactoryGirl.create(:user, contacts: [])
      get :show, format: 'json', id: tech.id
      expect(response).to be_success
    end
  end

  describe "POST 'create'" do

    let(:technologist_attributes) do
      [
        twitter: "techprobono",
        github: "techprobono",
        email: "techprobono@email.com",
        portfolio: "techprobono.org",
        skills: "html,ruby"
      ]
    end

    it "creates technologist" do
      expect {
        post :create, *technologist_attributes
      }.to change(User, :count).by(1)
    end

    it "creates technologist with contacts" do
      expect {
        post :create, *technologist_attributes
      }.to change(Contact, :count).by(3)
    end
  end
end
