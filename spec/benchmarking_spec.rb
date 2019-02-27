require_relative "../balanced_parentheses"
require_relative "../balanced_parentheses_two"
require_relative "sample_strings"

require "benchmark"

describe "Benchmarking#balanced?" do
  let(:first_implementation) { BalancedParentheses }
  let(:second_implementation) { BalancedParenthesesTwo }
  

  context "when comparing the performance of the optimized solution against the unopitmized solution" do


    let(:sample_balanced_string) { BALANCED_STRINGS.sample }
    

    let(:balanced_unoptimized_performance) { Benchmark.realtime {
        first_implementation.new(:sample_balanced_string).balanced?
      }
    }

    let(:balanced_optimized_performance) { Benchmark.realtime {
        second_implementation.new(:sample_balanced_string).balanced?
      }
    }

    it "should be within 1 millisecond when evaluating a balanced string" do
      expect(balanced_optimized_performance).to be_within(0.001).of(balanced_unoptimized_performance)
    end


    let(:sample_unbalanced_string) { UNBALANCED_STRINGS.sample }

    let(:unbalanced_unoptimized_performance) { Benchmark.realtime {
        first_implementation.new(:sample_unbalanced_string).balanced?
      }
    }

    let(:unbalanced_optimized_performance) { Benchmark.realtime {
        second_implementation.new(:sample_unbalanced_string).balanced?
      }
    }

    it "should be within 1 millisecond when evaluating a balanced string" do
      expect(unbalanced_optimized_performance).to be_within(0.001).of(unbalanced_unoptimized_performance)
    end
  end  
end
