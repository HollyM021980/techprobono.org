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
  end

end
