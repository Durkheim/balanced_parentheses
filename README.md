# balanced_parentheses

### Objective

Write an algorithm that returns that determines whether parentheses in a string are balanced.

### Requirements

`gem install rspec`

### Implementation

Two implementations have been written for this challenge.

The first provides a series of object-oriented approaches, with several methods assuming single-responsibility.
An array of only parentheses is constructed from the string, and from there, there are checks to see if the count of open and closed parens match,
as well as whether the order of parens is balanced. To execute this implementation, call the following:

```
BalancedParentheses::ObjectOriented.new(str).balanced?
```

The second implementation splits the string into an array of chars, iterates through the array, and keeps a ledger of whether a string is balanced.
After iterating is complete, if the ledger is not 0, then the string has unbalanced parentheses. To execute this implementation, call the
following:

```
BalancedParentheses::Ledger.new(str).balanced?
```

### Testing

For each implementation, specs were written to handle a variety of balanced and unbalanced cases. In addition, a benchmarking spec was written,
highlighting that each implementation's performance is within 1 millisecond of the other. More often than not, the ledger implementation was marginally faster.
To run all tests from the root of the project directory, run the following from the terminal:

```
rspec spec/
```

You can also run each test individually:

```
rspec spec/balanced_parentheses/{spec_file}.rb
```

### Notes

When a string is passed in that has no parentheses, it is deemed balanced according to these current implementations. This is desired behavior.

Other data types may also be passed when initializing the class for either implementation, because we convert them to strings upon instantiation.
