module ApplicationHelper
  def check_stock(obj)
    case obj.in_stock
    when true
      "<span class='badge badge-primary'>In Stock</span>".html_safe
    when false
      "<span class='badge badge-danger'>Out of Stock</span>".html_safe
    else
      "<span class='badge badge-danger'>#{obj.in_stock}</span>".html_safe
    end
  end
end
