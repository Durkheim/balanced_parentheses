class OptimizedBalancedParentheses

  OPEN_PARENS = "("
  CLOSED_PARENS = ")"

  def initialize(str)
    @str = str.to_s
  end

  def balanced?
    ledger = 0

    @str.each_char do |char|
      ledger += 1 and next if char.include?(OPEN_PARENS)

      ledger -= 1 if char.include?(CLOSED_PARENS)

      break if ledger < 0 
    end

    ledger.zero?
  end
end
