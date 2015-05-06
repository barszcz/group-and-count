require "rspec"
require "group_and_count"


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
      expect(mapped).to eq({a: 2, b: 3, c: 4})
    end
  end
end

describe Array do
  describe '#group_and_count' do
    let(:events) do
      [
        { event: 'bill.split', user: 'Ray Green', city: 'Boston', time_of_day: 'morning', timestamp: 23981398 },
        { event: 'promo.used', user: 'Jon Wicks', city: 'New York', time_of_day: 'afternoon', amount: 10.0, timestamp: 93219323 },
        { event: 'promo.used', user: 'Robin Chou', city: 'New York', time_of_day: 'afternoon', amount: 15.0, timestamp: 28138233 },
        { event: 'bill.split', user: 'John Malcom', city: 'Chicago', time_of_day: 'evening', timestamp: 32189389 },
        { event: 'bill.split', user: 'Mark Wang', city: 'Boston', time_of_day: 'evening', timestamp: 43890121 }
      ]
    end

    it "returns a simple count when no keys are given" do
      counted = events.group_and_count([])
      expect(counted).to eq 5
    end

  end
end
