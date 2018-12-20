# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resolvers::LinksSearch do
  before do
    @result = Resolvers::LinksSearch.call(nil, args, nil)
  end

  let(:user) do
    User.create(name: 'test',
                email: 'test@example.com',
                password: '123456')
  end

  let!(:links) do
    [
      Link.create(description: 'test1', url: 'http://test1.com', user: user),
      Link.create(description: 'test2', url: 'http://test2.com', user: user),
      Link.create(description: 'test3', url: 'http://test3.com', user: user),
      Link.create(description: 'test4', url: 'http://test4.com', user: user)
    ]
  end

  let(:args) do
    { filter:
      {
        'description_contains' => 'test1',
        'OR' => [{
          'url_contains' => 'test2',
          'OR' => [{
            'url_contains' => 'test3'
          }]
        }, {
          'description_contains' => 'test2'
        }]
      } }
  end

  it 'filters the results' do
    expect(@result.map(&:description).sort).to eq [links.first, links.second, links.third].map(&:description).sort
  end
end
