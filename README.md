# Bank tech test

Today, you'll practice doing a tech test.

For most tech tests, you'll essentially have unlimited time.  This practice session is about producing the best code you can when there is a minimal time pressure.

You'll get to practice your OO design and TDD skills.

You'll work alone, and you'll also review your own code so you can practice reflecting on and improving your own work.

## Instructions

* clone this repo
* run bundle install
* run rspec
* use IRB or PRY: load firstly the transactions, followed by printer.

## Used technologies
* ruby 2.4.0p0
* rspec (3.6.0)
* simplecov (0.14.1)

## Specification

### User Stories
```
As a Customer
So as I can handle my money at the bank
I would like to make transactions
```

```
As a Customer
So as I can increase my money
I would like to make deposit into my account
```

```
As a Customer
So as I can get my money
I would like to withdraw from my account
```

```
As a Customer
So as I know the state of my account
I would like to see a statement with all transactions
```

### Requirements

* You should be able to interact with the your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012
**And** a deposit of 2000 on 13-01-2012
**And** a withdrawal of 500 on 14-01-2012
**When** she prints her bank statement
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
