require 'spec_helper'

describe GoodcauseController do

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', format: 'json', id: 1
      expect(response).to be_success
    end
  end

  describe "POST 'create'" do
    let(:goodcause){ FactoryGirl.attributes_for(:organisation) }

    it "creates goodcause" do
      expect {
       post :create, format: :json, goodcause: goodcause
      }.to change(Organisation, :count).by(1)
    end

    context "goodcause with contacts" do
      let(:website1) { FactoryGirl.attributes_for(:contact,
                                                 contact_type:'websiste',
                                                 value: 'goodcause.com') }

      let(:website2) { FactoryGirl.attributes_for(:contact,
                                                 contact_type:'websiste',
                                                 value: 'goodcause.net') }

      let(:github) { FactoryGirl.attributes_for(:contact, value: 'goodcause') }

      let(:goodcause_with_contacts) do
        goodcause.merge(contacts_attributes: [website1, website2, github])
      end

      it "creates goodcause with contacts" do
        expect {
          post :create, format: :json, goodcause: goodcause_with_contacts
        }.to change(Contact, :count).by(3)
      end
    end
  end
end
