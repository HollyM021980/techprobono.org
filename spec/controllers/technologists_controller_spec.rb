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
        skills: "html,ruby",
        password: "foo",
        password_confirmation: "foobar"
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

  describe "POST 'update'" do

    let(:current_user) { FactoryGirl.create(:user, contacts:[]) }

    let(:contacts) do
      { 
        "0" => {contact_type: "twitter", value: "techprobono"},
        "1" => {contact_type: "github", value: "techprobono"}
      }
    end

    before do
      controller.stub(:current_user).and_return(current_user)
    end

    xit "adds contacts" do
      post :update, contacts: contacts
      expect(controller.technologist_repo).to receive(:update).with(current_user, contacts)
    end
  end
end
