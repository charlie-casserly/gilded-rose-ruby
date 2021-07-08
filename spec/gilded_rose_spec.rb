require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do

    xit "does not change the name" do
      items = [item]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    context 'Sulfuras' do
      it "Sulfuras never decreases in quality" do 
        items = [Item.new("Sulfuras, Hand of Ragnaros", 80, 80)]
        10.times { GildedRose.new(items).update_quality }
        expect(items[0].quality).to eq(80)
      end

      it "Sulfuras never needs to be sold" do 
        items = [Item.new("Sulfuras, Hand of Ragnaros", 80, 80)]
        10.times { GildedRose.new(items).update_quality }
        expect(items[0].sell_in).to eq(80)
      end
    end

    context "regular item" do
      it "loses 1 quality in one day" do
        items = [Item.new("regular item", 10, 10)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq(9)
      end

      it "loses 1 sell_in in one day" do
        items = [Item.new("regular item", 10, 10)]
        GildedRose.new(items).update_quality
        expect(items[0].sell_in).to eq(9)
      end

      it "takes double quality damage if sell_in less than 0" do 
        items = [Item.new("regular item", 2, 10)]
        5.times { GildedRose.new(items).update_quality }
        expect(items[0].quality).to eq(2)
      end

      it "quality can never be negative" do 
        items = [Item.new("regular item", 2, 10)]
        15.times { GildedRose.new(items).update_quality }
        expect(items[0].quality).to eq(0)
      end
    end

    context "Aged Brie" do 
      it "increases in quality with age" do
        items = [Item.new("Aged Brie", 10, 10)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq(11)
      end

      it "can never exceed 50 quality" do 
        items = [Item.new("Aged Brie", 50, 50)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq(50)
      end
    end
  end
end
