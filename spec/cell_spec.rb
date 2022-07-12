
require './lib/ship'
require './lib/cell'

describe Cell do
    cell = Cell.new("B4")
    it 'exists' do 
        expect(cell).to be_an_instance_of(Cell)
      end
    it 'each new cell has a coordinate' do 
        expect(cell.coordinate).to eq("B4")
      end 
    it 'each new cell does not contain a ship to begin with' do
        expect(cell.ship).to eq(nil)
        expect(cell.empty?).to eq(true)
      end
    
      it 'a cell can have a ship placed in it' do
        cruiser = Ship.new("Cruiser", 3)
        expect(cell.place_ship(cruiser)).to eq(cruiser)
        expect(cell.ship).to eq(cruiser)
        expect(cell.empty?).to eq(false)
      end

it 'check if ship has been fired upon' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cell.fired_upon?).to eq(false)
end

it 'if ship has been fired upon, health decreases by 1' do
    cruiser = Ship.new("Cruiser", 3)
    cell.fire_upon
    expect(cell.ship.health).to eq(2)
    expect(cell.fired_upon?).to eq(true)
end


end