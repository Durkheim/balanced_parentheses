module BalancedParentheses
  class Recursive

    OPEN_PARENS = "(".freeze
    CLOSED_PARENS = ")".freeze

    def initialize(str)
      @str = str.to_s
      @last_str_index = @str.length - 1
    end

    def balanced?
      parsed_str_balanced?
    end

    private

    def parsed_str_balanced?
      parse
    end

    def parse(ledger: 0, index: 0)
      return ledger == 0 if index > @last_str_index
                
      char = @str.slice(index)

      index += 1

      if increment_ledger?(char)
        ledger += 1 
        parse(ledger: ledger, index: index)
      end

      if decrement_ledger?(char)
        ledger -= 1

        return false if ledger < 0
        parse(ledger: ledger, index: index)
      end

      parse(ledger: ledger, index: index)
    end

    def increment_ledger?(char)
      char.include?(OPEN_PARENS)
    end

    def decrement_ledger?(char)
      char.include?(CLOSED_PARENS)
    end

  end
end
