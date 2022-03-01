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
  end
end