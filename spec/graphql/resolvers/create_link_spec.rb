# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resolvers::CreateLink do
  before do
    described_class.new.call(nil, args, {})
  end

  let(:args) do
    {
      url: 'http://npmjs.com/package/graphql-tools',
      description: 'Best tools!'
    }
  end

  it 'it creates a new link' do
    expect(Link.first.url).to eq 'http://npmjs.com/package/graphql-tools'
    expect(Link.first.description).to eq 'Best tools!'
  end
end
