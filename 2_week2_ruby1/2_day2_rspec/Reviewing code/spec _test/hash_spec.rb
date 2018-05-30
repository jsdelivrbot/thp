
describe Hash do
  
  before do
    @hash = Hash.new({:hello => 'world'})
  end


  it "should return a blank instance" do
    expect{Hash.new == {}}
  end

  it "hash the correct information in a key" do
   expect{@hash[:hello].should == 'world'}
  end

end