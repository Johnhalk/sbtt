class Transactions

  attr_reader :transaction_history

  def initialize
    @transaction_history = []
  end

  def show_statement
    if @transaction_history.length != 0
      puts "date".rjust(10)        +"|| credit ".rjust(10) +"|| debit ".rjust(10) + "|| balance||".rjust(10)
      @transaction_history.each do |x| puts "#{x[:date]}  ||   #{x[:credit]}  ||    #{x[:debit]}   || #{x[:balance]}      ||"
      end
    end
  end

end
