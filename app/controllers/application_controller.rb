class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  
  
  rescue_from CanCan::AccessDenied do |exception|
    if current_user.role.eql? "super_admin"
      redirect_to main_app.rails_admin_path, :alert => exception.message
    elsif current_user.role.eql? "member"
      redirect_to main_app.members_root_path, :alert => exception.message
    elsif current_user.role.eql? "admin"
      redirect_to main_app.admin_root_path, :alert => exception.message
    end
  end

   def after_sign_in_path_for(resource)
    if resource.role.eql? "super_admin"
      rails_admin_path
    elsif resource.role.eql? "member"
      members_root_path
    elsif resource.role.eql? "admin"
      admin_root_path
    end
   end
end