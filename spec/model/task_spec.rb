require 'rails_helper'

RSpec.describe Task, type: :model do

  it { should validate_presence_of :description }
  it { should belong_to :list }

  it 'has a maximum length of 50 characters' do
    task = Task.new(description: "z" * (51))
    expect(task.save()).to eq(false)
  end

  it 'converts the description to lowercase' do
    task = Task.create(description: "HIKE PORTLAND")
    expect(task.description).to eq("hike portland")
  end
end
