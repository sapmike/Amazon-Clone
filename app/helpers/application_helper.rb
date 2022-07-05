module ApplicationHelper
  def current_order
    # Using Find by id to avoid potential errors
    if Order.find_by_id(session[:order_id]).nil?
        Order.new
    else
      Order.find_by_id(session[:order_id])
    end
  end
end
