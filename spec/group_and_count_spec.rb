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

    let(:counted_events) do
      {
        "bill.split" => {
          "Boston" => {
            "morning" => 1,
            "evening" => 1
            },
            "Chicago" =>  {
              "evening" => 1
            }
            },
            "promo.used" => {
              "New York" => { 
                "afternoon" => 2 
              }
            }
          }
        end

    let(:events_keys) { [:event, :city, :time_of_day] }

    it "returns a simple count when no keys are given" do
      counted = events.group_and_count([])
      expect(counted).to eq 5
    end

    it "returns properly grouped and counted results" do
      gc = events.group_and_count(events_keys)
      expect(gc).to eq(counted_events)
    end

    let(:heterogeneous) do
      [
        { a: 1, b: 2, c: 5, d: 8},
        { a: 1, b: 2, d: 8 },
        { a: 1, b: 2, d: 7, foobar: 22 },
        { a: 1, b: 3, c: 47, d: 8, idunnolol: "I dunno lol" },
        { a: 3, b: 4, d: 2, name: "Lil B", based_level: 31 }
      ]
    end

    let(:counted_hetero) do
      {
        1 => {
          2 => {
            7 => 1,
            8 => 2
            },
            3 => {
              8 => 1
            }
            },
            3 => {
              4 => {
                2 => 1
              }
            }
          }
        end

    let(:hetero_keys) { [:a, :b, :d] }

    it "doesn't choke on heterogeneous record structures" do
      gc = heterogeneous.group_and_count(hetero_keys)
      expect(gc).to eq(counted_hetero)
    end

  end
end
