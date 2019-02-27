require_relative "../balanced_parentheses"
require_relative "sample_strings"

describe BalancedParentheses do

  let(:klass) { BalancedParentheses }

  describe "#balanced?" do

    context "when a string contains balanced parentheses" do
      it "should return true" do
        expect(klass.new(BALANCED_STRINGS[0]).balanced?).to be true
        expect(klass.new(BALANCED_STRINGS[1]).balanced?).to be true
        expect(klass.new(BALANCED_STRINGS[2]).balanced?).to be true
        expect(klass.new(BALANCED_STRINGS[3]).balanced?).to be true
        expect(klass.new(BALANCED_STRINGS[4]).balanced?).to be true
        expect(klass.new(BALANCED_STRINGS[5]).balanced?).to be true
      end
    end

    context "when a string contains unbalanced parentheses" do
      it "should return false" do
        expect(klass.new(UNBALANCED_STRINGS[0]).balanced?).to be false
        expect(klass.new(UNBALANCED_STRINGS[1]).balanced?).to be false
        expect(klass.new(UNBALANCED_STRINGS[2]).balanced?).to be false
      end
    end


    context "when other data types are passed to the class" do
      it "should convert the structures to strings and handle appropriately" do
        expect(klass.new(nil).balanced?).to be true
        expect(klass.new(1234567).balanced?).to be true
        expect(klass.new(1234567.21).balanced?).to be true
        expect(klass.new((1..5)).balanced?).to be true
        expect(klass.new([]).balanced?).to be true
        expect(klass.new({}).balanced?).to be true
      end
    end
  end
end
