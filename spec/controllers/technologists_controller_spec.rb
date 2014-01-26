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

    it "creates technologist" do
      expect {
       post :create, format: :json, technologist: technologist
      }.to change(User, :count).by(1)
    end

    context "technologist with contacts" do
      let(:github) { FactoryGirl.attributes_for(:contact) }

      let(:stackoverflow) do
        FactoryGirl.attributes_for(:contact, contact_type: 'stackoverflow')
      end

      let(:technologist_with_contacts) do
        technologist.merge(:contacts_attributes => [github, stackoverflow])
      end


      it "creates technologist with contacts" do
        expect {
          post :create, format: :json, technologist: technologist_with_contacts
        }.to change(Contact, :count).by(2)
      end
    end
  end
end
