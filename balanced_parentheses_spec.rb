require_relative "balanced_parentheses"

describe BalancedParentheses do

  describe "#balanced?" do

    context "when string contains balanced parentheses" do
      it "should return true" do
        expect(BalancedParentheses.new("()").balanced?).to be true
        expect(BalancedParentheses.new("(()())").balanced?).to be true
        expect(BalancedParentheses.new("(())").balanced?).to be true
        expect(BalancedParentheses.new("(())").balanced?).to be true
        expect(BalancedParentheses.new("(())").balanced?).to be true
      end
    end


    context "when string contains unbalanced parentheses" do
      it "should return false" do
        expect(BalancedParentheses.new(")(").balanced?).to be false
        expect(BalancedParentheses.new("())").balanced?).to be false
        expect(BalancedParentheses.new("())").balanced?).to be false
      end
    end

  end
  
end
