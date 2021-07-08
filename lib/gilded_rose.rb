class GildedRose

  def initialize(items)
    @items = items
  end 

  def update_quality()
    @items.each do |item|
      # Lines 9 - 15: If item name isn't Aged Bried and isn't a backstage pass, and quality is higher than 0, and isn't Sulfaras, quality decreases by 1.
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          if item.name != "Sulfuras, Hand of Ragnaros"
            decrease_item_quality_by_1(item)
          end
        end
      else
        if item.quality < 50
          increase_item_quality_by_1(item)
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                increase_item_quality_by_1(item)
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                increase_item_quality_by_1(item)
              end
            end
          end
        end
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                decrease_item_quality_by_1(item)
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            increase_item_quality_by_1(item)
          end
        end
      end
    end
  end

  private 

  def decrease_item_quality_by_1(item)
    item.quality -= 1
  end

  def increase_item_quality_by_1(item)
    item.quality += 1
  end
end