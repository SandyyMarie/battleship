require './lib/ship'

RSpec.describe Ship do
  cruiser = Ship.new("Cruiser", 3)

  it 'exists and has a ship type and length' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser).to be_an_instance_of(Ship)
    expect(cruiser.name).to eq("Cruiser")
    expect(cruiser.length).to eq(3)
    expect(cruiser.health).to eq(cruiser.length)
  end

  it 'a ship is not sunk to begin with' do
    expect(cruiser.sunk?).to eq(false)
  end

  it 'can be hit, reducing health by 1' do 
    cruiser.hit

    expect(cruiser.health).to eq(2)
    expect(cruiser.sunk?).to eq(false)
  end

  it 'when ship health is 0, ship is sunk' do 
    cruiser.hit
    cruiser.hit
    cruiser.hit

    expect(cruiser.sunk?).to eq(true)
  end

end
