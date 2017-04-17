require 'date'

class Directdebits

  attr_reader :direct_debits, :balance_after_debits, :debit_amount

  MINIMUM_DEBIT = 0

  def initialize(amount = MINIMUM_DEBIT)
    @amount = amount
    @debit_date
    @direct_debits = []
  end

  def create_debit
    begin
        print 'Please enter the amount of the direct debit: £'
        amount = gets.chomp
        @amount = Integer(amount)
      rescue
        print "Not a valid amount, "
        retry
      end
      begin
        print 'Please enter the date you wish the amount to be debited:'
        debit_date = gets.chomp
        @debit_date = Date.strptime(debit_date ,'%d/%m/%Y')
      rescue
        print "not a valid date, "
      retry
    end
    @direct_debits  << { amount: @amount, due: @debit_date }
  end

  def pending_debits
    debit_amount_array = @direct_debits.map{|x| x[:amount]}
    @debit_amount = debit_amount_array.inject(0){|sum,x| sum + x}
  end

end
