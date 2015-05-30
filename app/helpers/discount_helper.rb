module DiscountHelper
  def generate_code
    Array.new(12){[*'0'..'9', *'A'..'Z'].sample}.join
  end
end
