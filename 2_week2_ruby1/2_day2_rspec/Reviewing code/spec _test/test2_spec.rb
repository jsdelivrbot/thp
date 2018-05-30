describe Burger do
  describe "#apply_ketchup" do
    subject { burger }
    before  { burger.apply_ketchup }
 
    context "with ketchup" do
      let(:burger) { Burger.new(:ketchup => true) }
 
      specify { subject.has_ketchup_on_it?.should be_true }
    end
 
    context "without ketchup" do
      let(:burger) { Burger.new(:ketchup => false) }
 
      specify { subject.has_ketchup_on_it?.should be_false }
    end
  end
end