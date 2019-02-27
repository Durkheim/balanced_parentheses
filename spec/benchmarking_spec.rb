require_relative "../balanced_parentheses"
require_relative "../balanced_parentheses_two"
require "benchmark"

describe "Benchmarking#balanced?" do
  let(:first_implementation) { BalancedParentheses }
  let(:second_implementation) { BalancedParenthesesTwo }
  

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
    

    let(:balanced_unoptimized_performance) { Benchmark.realtime {
        first_implementation.new(:sample_balanced_string).balanced?
      }
    }

    let(:balanced_optimized_performance) { Benchmark.realtime {
        second_implementation.new(:sample_balanced_string).balanced?
      }
    }

    it "should generally peform similarly when checking if balanced strings" do
      expect(balanced_optimized_performance).to be_within(0.1).of(balanced_unoptimized_performance)
    end


    let(:sample_unbalanced_string) { unbalanced_strings.sample }

    let(:unbalanced_unoptimized_performance) { Benchmark.realtime {
        first_implementation.new(:sample_unbalanced_string).balanced?
      }
    }

    let(:unbalanced_optimized_performance) { Benchmark.realtime {
        second_implementation.new(:sample_unbalanced_string).balanced?
      }
    }

    it "should generally perform similarly when checking unbalanced strings" do
      expect(unbalanced_optimized_performance).to be_within(0.1).of(unbalanced_unoptimized_performance)
    end
  end  
end
