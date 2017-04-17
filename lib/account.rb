require_relative 'transactions'
require_relative 'directdebits'

class Account

  attr_reader :balance, :transactions, :debits

  attr_accessor :transaction_history, :show_statement, :balance


  DEFAULT_BALANCE = 0
  MIN_DEPOSIT_AMOUNT = 0
  MAX_WITHDRAW_AMOUNT = 250

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @debit_balance = 0
    @transactions = Transactions.new
    @debits = Directdebits.new
  end

  def deposit(amount)
    message = 'Amount must be greater than zero.'
    raise message if amount <= MIN_DEPOSIT_AMOUNT
    @balance += amount
    @transactions.transaction_history << { date: Time.new.strftime('%d/%m/%Y'), credit: amount, debit: '' , balance: @balance }
  end

  def withdraw(amount)
    message_one = 'Can not exceed available funds.'
    message_two = 'Can not withdraw past maximum limit.'
    raise message_one if amount > @balance
    raise message_two if amount > MAX_WITHDRAW_AMOUNT
    @balance -= amount
    @transactions.transaction_history << { date: Time.new.strftime('%d/%m/%Y'), credit: '', debit: amount , balance: @balance }
  end

  def display_transactions
    @transactions.transaction_history
  end

  def create_debit
    @debits.create_debit
  end

  def balance_after_debits
    @debits.pending_debits
  end

  def pending_debits
    balance_after_debits =  @balance - @debits.pending_debits
    p "Your current balance for the month, after pending debits is: £ #{balance_after_debits}"
  end

  def statement
    @transactions.show_statement
  end

end
