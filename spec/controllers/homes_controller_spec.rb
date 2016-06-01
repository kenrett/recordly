require 'rails_helper'

describe HomesController, :type => :controller do
  describe "#index" do
    it "responds with success" do
      get :index

      expect(response.status).to eq(200)
    end
  end
end
