module ApplicationHelper
  def dmy(date)
    l date, format: "%d/%m/%Y"
  end

  def hm(date)
    l date, format: "%H:%M"
  end

  def dmyhm(date)
    l date, format: "%d/%m/%Y às %H:%M"
  end

  def comma(value)
    value = value.to_s.sub('.', ',')
  end

  def original_url
    base_url + original_fullpath
  end

  def title(page_title)
    content_for :title, page_title.to_s
  end

  def description(page_description)
    content_for :description, page_description.to_s
  end

  def price_with_tax(price)
    taxes = Tax.all
    t = 0
    taxes.each do |tax|
      t += tax.percentage
    end
    with_tax = price + price * t / 100
  end
end
