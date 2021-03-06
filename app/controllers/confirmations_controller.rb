class ConfirmationsController < Devise::ConfirmationsController
  #private
   def after_confirmation_path_for(resource_name, resource)
    sign_in(resource)
   end

  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])

    if resource.errors.empty?
      set_flash_message(:notice, :confirmed) if is_flashing_format?
      sign_in(resource) 
      redirect_to site_home_path
    else
      respond_with_navigational(resource.errors, :status => :unprocessable_entity){ render :new }
    end
  end


end