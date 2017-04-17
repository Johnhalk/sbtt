require 'account.rb'
require 'test_helper.rb'

describe Account do
  subject(:account) {described_class.new}
  it 'checks that the the account has a balance' do
      expect(subject).to respond_to(:balance)
    end
  it 'has an initial balance of 0'do
    expect(subject.balance).to eq(Account::DEFAULT_BALANCE)
  end

  describe '#deposit' do
 it { is_expected.to respond_to(:deposit).with(1).argument }
  it 'does not allow you to deposit zero or negative amounts' do
      expect {subject.deposit(Account::MIN_DEPOSIT_AMOUNT)}.to raise_error 'Amount must be greater than zero.'
  end
     it 'can deposit money to your balance' do
      subject.deposit(200)
      expect(subject.balance).to eq(200)
    end
    it 'adds transaction data to a transaction log' do
      subject.deposit(200)
      expect(subject.display_transactions.length).not_to be([])
    end
  end

  describe '#withdraw' do
    it {is_expected.to respond_to(:withdraw).with(1).argument }
      it 'can withdraw money from own account' do
        subject.deposit(200)
        subject.withdraw(100)
        expect(subject.balance).to eq(100)
      end

      it 'can not withdraw more than available funds' do
        subject.deposit(100)
        expect {subject.withdraw(101)}.to raise_error 'Can not exceed available funds.'
      end

      it 'can not withdraw more than the maximum withdrawal limit' do
        subject.deposit(500)
        expect {subject.withdraw(Account::MAX_WITHDRAW_AMOUNT+1)}.to raise_error 'Can not withdraw past maximum limit.'
      end
      it 'adds transaction data to a transaction log' do
        subject.deposit(350)
        subject.withdraw(200)
        expect(subject.display_transactions.length).not_to be([])
      end
  end

  describe '#display_transactions' do
    it 'is expected to initially be an empty array' do
      expect(subject.display_transactions).to eq([])
    end
    it 'holds transactional data in the array' do
      multiple_transactions
    end
  end


    describe '#statement' do
      it 'is expected to print out nothing if no previous transactions' do
        expect(subject.statement).to eq(nil)
      end
      it 'is expected to display a deposit transaction' do
        subject.deposit(250)
        expect(subject.statement).to include(date: Time.new.strftime('%d/%m/%Y'), credit: 250, debit: '' , balance: 250)
      end
      it 'is expected to disply multiple transactions' do
        multiple_deposits
      end
      it 'is expected to display withdrawal transactions'do
        subject.deposit(200)
        subject.withdraw(100)
        expect(subject.statement).to include(date: Time.new.strftime('%d/%m/%Y'), credit: '', debit: 100 , balance: 100)
      end
      it 'is expected to display multiple withdraw and deposit data' do
        many_transactions
      end
    end
end
