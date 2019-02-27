module BalancedParentheses
  class ObjectOriented

    OPEN_PARENS = "(".freeze
    CLOSED_PARENS = ")".freeze

    def initialize(str)
      @str = str.to_s
    end

    def balanced?
      balanced_parens_count? && balanced_parens_order? ? true : false
    end

    private

    def characters
      @str.chars
    end

    def collection_of_parens
      @collection_of_parens ||= characters.select { |chr| chr == OPEN_PARENS || chr == CLOSED_PARENS }
    end

    def balanced_parens_count?
      open_parentheses_count == closed_parentheses_count
    end

    def balanced_parens_order?
      !starts_with_closing_parentheses? &&
      !ends_with_open_parentheses?
    end

    def starts_with_closing_parentheses?
      collection_of_parens.first == CLOSED_PARENS
    end

    def ends_with_open_parentheses?
      collection_of_parens.last == OPEN_PARENS
    end

    def open_parentheses_count
      collection_of_parens.select { |paren| paren == OPEN_PARENS }.count
    end

    def closed_parentheses_count
      collection_of_parens.select { |paren| paren == CLOSED_PARENS }.count
    end
    
  end
end

