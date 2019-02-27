require_relative "../../balanced_parentheses/object_oriented"
require_relative "../../balanced_parentheses/ledger"
require_relative "sample_strings"

require "benchmark"

describe "Benchmarking #balanced?" do
  let(:object_oriented_implementation) { BalancedParentheses::ObjectOriented }
  let(:ledger_implementation) { BalancedParentheses::Ledger }
  

  context "when comparing the performance of implementations" do


    let(:sample_balanced_string) { BALANCED_STRINGS.sample }
    

    let(:balanced_performance_of_object_oriented_implementation) { Benchmark.realtime {
        object_oriented_implementation.new(:sample_balanced_string).balanced?
      }
    }

    let(:balanced_performance_of_ledger_implementation) { Benchmark.realtime {
        ledger_implementation.new(:sample_balanced_string).balanced?
      }
    }

    it "should be within 1 millisecond when evaluating a balanced string" do
      expect(balanced_performance_of_ledger_implementation).to be_within(0.001).of(balanced_performance_of_object_oriented_implementation)
    end


    let(:sample_unbalanced_string) { UNBALANCED_STRINGS.sample }

    let(:unbalanced_performance_of_object_oriented_implementation) { Benchmark.realtime {
        object_oriented_implementation.new(:sample_unbalanced_string).balanced?
      }
    }

    let(:unbalanced_performance_of_ledger_implementation) { Benchmark.realtime {
        ledger_implementation.new(:sample_unbalanced_string).balanced?
      }
    }

    it "should be within 1 millisecond when evaluating an unbalanced string" do
      expect(unbalanced_performance_of_ledger_implementation).to be_within(0.001).of(unbalanced_performance_of_object_oriented_implementation)
    end
  end  
end
