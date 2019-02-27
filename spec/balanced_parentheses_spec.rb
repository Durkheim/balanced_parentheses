require_relative "../balanced_parentheses"

describe BalancedParentheses do

  let(:klass) { BalancedParentheses }

  describe "#balanced?" do

    let(:balanced_strings) {
      [
        "()",
        "(()())",
        "(())",
        "sadfasdfasdfasdfas(assdfasdfasdfasd(23423413)[]{}//sacedfds...)",
        "(()())()",
        "",
      ].shuffle
    }

    let(:unbalanced_strings) {
      [
        ")(",
        "())",
        ")",
      ].shuffle
    }

    context "when a string contains balanced parentheses" do
      it "should return true" do
        expect(klass.new(balanced_strings[0]).balanced?).to be true
        expect(klass.new(balanced_strings[1]).balanced?).to be true
        expect(klass.new(balanced_strings[2]).balanced?).to be true
        expect(klass.new(balanced_strings[3]).balanced?).to be true
        expect(klass.new(balanced_strings[4]).balanced?).to be true
        expect(klass.new(balanced_strings[5]).balanced?).to be true
      end
    end

    context "when a string contains unbalanced parentheses" do
      it "should return false" do
        expect(klass.new(unbalanced_strings[0]).balanced?).to be false
        expect(klass.new(unbalanced_strings[1]).balanced?).to be false
        expect(klass.new(unbalanced_strings[2]).balanced?).to be false
      end
    end


    context "when other data types are passed to the class" do
      it "should convert the structures to strings and handle appropriately" do
        expect(klass.new(nil).balanced?).to be true
        expect(klass.new(1234567).balanced?).to be true
        expect(klass.new((1..5)).balanced?).to be true
      end
    end
  end
end
