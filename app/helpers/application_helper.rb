module ApplicationHelper
  def current_order
    # Using Find by id to avoid potential errors
    if session[:order_id] && Order.find(session[:order_id])
      Order.find(session[:order_id])
    else
      Order.create user_id: session[:user_id]
    end
  end
end
