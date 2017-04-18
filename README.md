## Implementing feature


```
Initial concept features

As a customer,
So that I can better utilise my monthly spending
I want to be able to be notified when my balance runs too low to pay my remaining monthly direct debits.
```

## Usage

- Clone this repo
- Run 'bundle' in project root directory
- open with 'irb' in the command line
- Type in the following commands to create a debit of 50:
```
require './lib/account'
acc = Account.new
acc.deposit(200)
acc.create_debit
```
And follow the prompts on screen input.

- Then Withdraw until balance is lower than theoretical balance:

```
acc.withdraw(100)
acc.withdraw(70)
```
