require "rspec"
require "group_and_count"

describe GroupAndCount do

  describe Hash do
    
    describe '#hmap' do

      let(:h) do
        {
          a: 1,
          b: 2,
          c: 3
        }
      end


      it 'maps values in a hash, leaving keys intact' do
        mapped = h.hmap { |el| el + 1}
        expect(mapped).to eq {a: 2, b: 3, c: 4}
      end


    end


  end

end