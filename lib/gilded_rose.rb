class GildedRose

  def initialize(items)
    @items = items
  end 

  def update_quality
    @items.each do |item|
      update(item)
    end
  end

  private 

  def update(item)
    if regular_item(item)
      decrease_item_quality_by_1(item)
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
              increase_item_quality_by_2(item)
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
          reduce_item_quality_to_zero(item)
        end
      else
        if item.quality < 50
          increase_item_quality_by_1(item)
        end
      end
    end
  end

  def regular_item(item)
    item.name != "Aged Brie" && 
      item.name != "Backstage passes to a TAFKAL80ETC concert" && 
        item.name != "Sulfuras, Hand of Ragnaros" &&
          item.quality > 0
  end

  def reduce_item_quality_to_zero(item)
    item.quality = 0
  end

  def decrease_item_quality_by_1(item)
    item.quality -= 1
  end

  def increase_item_quality_by_1(item)
    item.quality += 1
  end

  def increase_item_quality_by_2(item)
    item.quality += 2
  end
end