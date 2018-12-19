# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resolvers::SignInUser do
  before do
    @result = described_class.new.call(nil, args, { cookies: {} })
  end

  let!(:user) { User.create! name: 'test', email: 'test@email.com', password: 'test' }

  let(:args) do
    {
      email: {
        email: user.email,
        password: user.password
      }
    }
  end

  it 'signs in the user' do
    expect(@result.token).to exist
  end
end
