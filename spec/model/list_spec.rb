require 'rails_helper'

RSpec.describe List, type: :model do

  it { should validate_presence_of :name }
  it { should have_many :tasks}

  it 'has a maximum length of 50 characters' do
    list = List.new(name: "z" * (51))
    expect(list.save()).to eq(false)
  end

  it 'converts the name to lowercase' do
    list = List.create(name: "GROCERY LIST")
    expect(list.name).to eq("grocery list")
  end
end
