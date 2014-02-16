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

      let(:technologist_attributes) do
        {"contacts_attributes" => { "0" => {"contact_type"=>"twitter", "value" => "techprobono"},
                                    "1" => {"contact_type"=>"github", "value" => "techprobono"},
                                    "2" => {"contact_type"=>"website", "value"=> "techprobono"}},
                       "email" => "techprobono@email.com", "skills"=>"" }
      end

      it "creates technologist with contacts" do
        expect {
          post :create, format: :json, technologist: technologist_attributes
        }.to change(Contact, :count).by(3)
      end


    end
  end
end
