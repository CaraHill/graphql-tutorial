# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resolvers::CreateUser do
  before do
    described_class.new.call(nil, args, {})
  end

  let(:args) do
    {
      name: 'Test User',
      authProvider: {
        email: {
          email: 'email@example.com',
          password: '[omitted]'
        }
      }
    }
  end

  it 'creates a new User' do
    user = User.first
    expect(user.name).to eq 'Test User'
    expect(user.email).to eq 'email@example.com'
  end
end
