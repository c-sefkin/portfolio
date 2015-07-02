require 'rails_helper'

describe Project do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :github }
  it { should have_many :skills }
end
