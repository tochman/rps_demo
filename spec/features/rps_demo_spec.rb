require './lib/rps_demo.rb'

describe 'Root Path' do
  describe 'GET /' do
    before { get '/' } 
    it 'is successful' do
      expect(last_response.status).to eq 200
    end
  end
end

feature 'application setup' do
  feature 'root path' do
    scenario 'is sucessfull' do
      visit '/'
      expect(page.status_code).to be 200
    end
  end
end 