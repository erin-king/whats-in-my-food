require 'rails_helper'

describe Food, type: :model do
  it 'has attributes' do
    attributes = {
      food_group: "Branded Food Products Database",
      name: "AMAZONAS RAINFOREST PRODUCT, SWEET POTATO FLOUR",
      ndbno: "45028068",
      ds: "LI",
      manu: "Amazonas Imports, Inc."
    }

    food = Food.new(attributes)

    expect(food.food_group).to eq(attributes[:group])
    expect(food.name).to eq(attributes[:name])
    expect(food.ndb_number).to eq(attributes[:ndbno])
    expect(food.data_source).to eq(attributes[:ds])
    expect(food.manufacturer).to eq(attributes[:manu])
  end
end
