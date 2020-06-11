require 'rails_helper'

RSpec.describe PlayersController, type: :controller do

  describe "GET #index" do
    before do
      create_list(:player, 5)
      get :index
    end


    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'returns valid JSON' do
      body = JSON.parse(response.body)
      expect(body['data'].length).to eq(5)
      expect(body['meta']['pagination']).to be_present
    end
  end

  describe "GET #download" do
    before do
      get :download, format: :csv
    end
  
    it "generate CSV" do
      expect(response.header['Content-Type']).to include 'text/csv'
    end
  end
end
