require 'spec_helper'

describe GoodcauseController do

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', format: 'json', id: 1
      expect(response).to be_success
    end
  end

  describe "POST 'create'" do
    it "returns http success" do
      post 'create',format: 'json', goodcause: {}
      expect(response).to be_success
    end
  end

end
