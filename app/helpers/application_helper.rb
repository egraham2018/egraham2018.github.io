module ApplicationHelper
 def empty
 	if user_signed_in?
    	if Order.find_by(id: session[:order_id], buyer_id: current_user.id)==nil
      		true
    	end
    end
  end
end
