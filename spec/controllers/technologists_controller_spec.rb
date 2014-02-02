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
    let(:technologist){ FactoryGirl.attributes_for(:user) }

    it "creates technologist" do
      expect {
       post :create, format: :json, technologist: technologist
      }.to change(User, :count).by(1)
    end

    context "technologist with contacts" do

      let(:technologist_with_contacts) do
        contacts = { github: "techprobono", stackoverflow: "techprobono" }
        technologist.merge(:contacts_attributes => contacts)
      end


      it "creates technologist with contacts" do
        expect {
          post :create, format: :json, technologist: technologist_with_contacts
        }.to change(Contact, :count).by(2)
      end
    end
  end
end
