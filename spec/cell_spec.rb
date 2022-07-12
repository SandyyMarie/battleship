
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
    describe 'Initializing' do
  
        cell = Cell.new("B4")
        cruiser = Ship.new("Cruiser", 3)
        

        it 'inititalizes with a cell, coordinate, nil ship, and is empty' do
            expect(cell).to be_a(Cell)
            expect(cell.coordinate).to eq("B4")
            expect(cell.ship).to eq(nil)
            expect(cell.empty?).to eq(true)
        end

        it 'can place a ship and show cell status' do
            cell.place_ship(cruiser)  

            expect(cell.ship).to eq(cruiser)
            expect(cell.empty?).to eq(false)
            expect(cell.fired_upon?).to eq(false)
        end

        it 'can display info when fired upon' do
            cell.place_ship(cruiser)
            cell.fire_upon
            
            expect(cell.ship.health).to eq(2)
            expect(cell.fired_upon?).to eq(true)
        end
    end

    describe 'Rendering method' do

        it 'can initially render' do
            cell_1 = Cell.new("B4")
            expect(cell_1.render).to eq(".")
        end

        it 'can render a miss' do
            cell_1 = Cell.new("B4") 
            cell_1.fire_upon
            expect(cell_1.render).to eq("M")
        end

        it 'can render a placed ship' do
            cell_2 = Cell.new("C3")
            cruiser = Ship.new("Cruiser", 3)
            cell_2.place_ship(cruiser)
            
            expect(cell_2.render).to eq(".")
            expect(cell_2.render(true)).to eq("S")
        end

        it 'can render a hit' do
            cell_2 = Cell.new("C3")
            cruiser = Ship.new("Cruiser", 3)
            cell_2.place_ship(cruiser)
            cell_2.fire_upon

            expect(cell_2.render).to eq("H")
            expect(cruiser.sunk?).to eq(false)
        end

        it 'can render a ship being sunk' do
            cell_2 = Cell.new("C3")
            cruiser = Ship.new("Cruiser", 3)
            cell_2.place_ship(cruiser)
            cell_2.fire_upon
            cruiser.hit
            cruiser.hit

            expect(cruiser.sunk?).to eq(true)
            expect(cell_2.render).to eq("X")
        end
    end

end