module ApplicationHelper
	def build_alert_classes(alert_type)
    classes = 'alert alert-dismissable'
    case alert_type.to_sym 
    when :alert, :danger, :error, :validation_errors
        classes += 'alert-danger'
    when :warning, :todo
        classes += 'alert-warning'
    when :notice, :success
        classes += 'alert-success'
    else 
        classes += 'alert-info'
    end
  end

  def render_stars(value)
  output = ''

  # Saved to variable for efficiency
  floored = value.floor

  # Adding full stars: If value is 2.5 then floored 
  # will be 2 (two full stars)
  floored.times { output << image_tag('star-on.png', size:'10x10') }

  # Getting the decimal part of the value by subtracting the
  # floored value, by the value. So if value is 2.7, then will be
  # 0.7 (Changed to >= to account for ability to use numbers like
  # 2.7 and will display a half star. If you would like to only
  # handle 0.5 then change back to ==)
  if (value - floored) == 0.5
      output << image_tag('half-star.png', size:'10x10')
  end

  # Completes sequence of 5 stars. Ex: if value is 2.7 then 5 - 2.7
  # is 2.3 The output will already have 2 full stars and 1 half star
  # so by flooring 2.3 we will get 2, which completes the total of 5
  #stars
  (5 - value).floor.times { output << image_tag('star-off.png', size:'10x10') }
  output.html_safe
end
def decimal_selection_array(start,limit,step_size=0.5)
    decimal_array = (start..limit).step(step_size).map(&:to_s).to_a
end

   def current_order
        #Use find by id to avoid potential errors
        if Order.find_by_id(session[:order_id]).nil?
           Order.new
        else
           Order.find_by_id(session[:order_id])
        end
    end

    def cart_count_over_one
        return total_cart_items if total_cart_items > 0
    end
    #Item.group(:category).sum(:quantity)
    def total_cart_items
   # @order_items = current_order.order_items
    total = current_order.order_items.map(&:quantity).sum
    return total if total > 0
  end
end
