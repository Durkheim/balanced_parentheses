require_relative "../optimized_balanced_parentheses"
require_relative "../balanced_parentheses"
require "benchmark"

describe "Benchmarking#balanced?" do
  let(:unoptimized_klass) { BalancedParentheses }
  let(:optimized_klass) { OptimizedBalancedParentheses }
  

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

  context "when comparing the optimized solution against the unopitmized solution" do

    let(:sample_balanced_string) { balanced_strings.sample }

    let(:unoptimized_performance) { Benchmark.realtime {
        unoptimized_klass.new(:sample_balanced_string).balanced?
      }
    }

    let(:optimized_performance) { Benchmark.realtime {
        optimized_klass.new(:sample_balanced_string).balanced?
      }
    }

    it "should generally peform faster when checking if strings are balanced" do
      expect(optimized_performance).to be_within(0.1).of(unoptimized_performance).or(be <= unoptimized_performance)
    end
  end  
end
