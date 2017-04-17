def multiple_transactions
  subject.deposit(350)
  subject.withdraw(200)
  expect(subject.display_transactions).to include(date: Time.new.strftime('%d/%m/%Y'), credit: 350, debit: '' , balance: 350)
  expect(subject.display_transactions).to include(date: Time.new.strftime('%d/%m/%Y'), credit: '', debit: 200 , balance: 150)
end

def multiple_deposits
  subject.deposit(250)
  subject.deposit(150)
  subject.deposit(50)
  expect(subject.statement).to include(date: Time.new.strftime('%d/%m/%Y'), credit: 250, debit: '' , balance: 250)
  expect(subject.statement).to include(date: Time.new.strftime('%d/%m/%Y'), credit: 150, debit: '' , balance: 400)
  expect(subject.statement).to include(date: Time.new.strftime('%d/%m/%Y'), credit: 50, debit: '' , balance: 450)
end


def many_transactions
  subject.deposit(250)
  subject.deposit(150)
  subject.withdraw(200)
  subject.deposit(50)
  subject.deposit(350)
  subject.withdraw(200)
  expect(subject.statement).to include(date: Time.new.strftime('%d/%m/%Y'), credit: 250, debit: '' , balance: 250)
  expect(subject.statement).to include(date: Time.new.strftime('%d/%m/%Y'), credit: 150, debit: '' , balance: 400)
  expect(subject.statement).to include(date: Time.new.strftime('%d/%m/%Y'), credit: '', debit: 200 , balance: 200)
  expect(subject.statement).to include(date: Time.new.strftime('%d/%m/%Y'), credit: 50, debit: '' , balance: 250)
  expect(subject.statement).to include(date: Time.new.strftime('%d/%m/%Y'), credit: 350, debit: '' , balance: 600)
  expect(subject.statement).to include(date: Time.new.strftime('%d/%m/%Y'), credit: '', debit: 200 , balance: 400)

end
