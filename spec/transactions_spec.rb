require 'transactions.rb'
require 'test_helper.rb'

describe Transactions do
  subject(:transactions) {described_class.new}
  it 'initializes with an empty array' do
    expect(subject.transaction_history).to eq([])
  end
end
