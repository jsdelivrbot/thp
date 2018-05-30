require_relative '../lib/orange'
require 'rspec'

describe OrangeTree do 

  it "Grow by one each year passes" do

    orange1 = OrangeTree.new(40)

    orange1.one_year_passes
    orange1.one_year_passes
    expect(orange1.height_tree).to eq(42)
  end

  it "The tree dies at the age of 50" do
   	orange2 = OrangeTree.new(1)

    (1..50).each {|i|
    	orange2.one_year_passes
    	}   
	expect(orange2.age).to eq(50)
	expect(orange2.alive).to eq(false)
  end

  it "after 5 years, it bears 20 oranges" do
	orange3 = OrangeTree.new(1)

    (1..5).each {|i|
    	orange3.one_year_passes
    	}   
	expect(orange3.number_oranges).to eq(20)
  end

  it "cannot have negative orange" do
	orange4 = OrangeTree.new(1)

    (1..5).each {|i|
    	orange4.one_year_passes
    	}   
    (1..21).each {|i|
    	orange4.pick_an_orange
    	} 
	expect(orange4.number_oranges).to eq(0)
  end

  it "after five year, number of irange = 20 + age of tree" do
	orange5 = OrangeTree.new(1)

    (1..7).each {|i|
    	orange5.one_year_passes
    	}   
	expect(orange5.number_oranges).to eq(27)
  end

end

