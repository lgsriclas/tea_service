require 'rails_helper'

describe 'Teas API' do
  context 'happy path' do
    it 'gets all teas' do
      tea_1 = create(:tea)
      tea_2 = create(:tea)

      get "/api/v1/teas"

      expect(response).to be_successful

      teas = JSON.parse(response.body, symbolize_names: true)

      expect(teas[:data].count).to eq(2)

      teas[:data].each do |tea|
        expect(tea[:attributes]).to have_key(:title)
        expect(tea[:attributes][:title]).to be_a(String)
        expect(tea[:attributes]).to have_key(:description)
        expect(tea[:attributes][:description]).to be_a(String)
        expect(tea[:attributes]).to have_key(:temperature)
        expect(tea[:attributes][:temperature]).to be_an(Integer)
        expect(tea[:attributes]).to have_key(:brew_time)
        expect(tea[:attributes][:brew_time]).to be_an(Integer)
      end
    end

    it 'gets one tea' do
      tea_1 = create(:tea)
      tea_2 = create(:tea)

      get "/api/v1/teas/#{tea_1.id}"

      expect(response).to be_successful

      tea = JSON.parse(response.body, symbolize_names: true)

      expect(tea[:data][:attributes]).to have_key(:title)
      expect(tea[:data][:attributes][:title]).to be_a(String)
      expect(tea[:data][:attributes]).to have_key(:description)
      expect(tea[:data][:attributes][:description]).to be_a(String)
      expect(tea[:data][:attributes]).to have_key(:temperature)
      expect(tea[:data][:attributes][:temperature]).to be_an(Integer)
      expect(tea[:data][:attributes]).to have_key(:brew_time)
      expect(tea[:data][:attributes][:brew_time]).to be_an(Integer)
    end
  end

  context 'sad path' do
    it 'sends an error code if tea does not exist' do

      get "/api/v1/teas/5000"

      error = (JSON.parse(response.body, symbolize_names: true))[:errors]

      expect(response).to_not be_successful

      expect(error[:details]).to eq("A tea with this id does not exist.")
    end
  end
end