require 'rails_helper'

describe UsdaService do
  describe 'instance methods' do
    it 'get_foods' do
      service = UsdaService.new
      results = service.get_foods('sweet potatoes')
      expect(results[:list][:total]).to eq(531)
    end
  end
end
