class Users::InvitationsController < Devise::InvitationsController
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name, :email])
  end

  def new
    @user = User.new
  end
  # this is called when creating invitation
  # should return an instance of resource class
  def create
    super
  #binding.pry
    User.invite!({email: resource.email, first_name: params[:user][:first_name], last_name: params[:user][:last_name], role: "member"}, resource)
  end

  def invite_resource
    ## skip sending emails on invite
    super do |u|
      u.skip_invitation = true
    end
  end

  # this is called when accepting invitation
  # should return an instance of resource class
  # def accept_resource
  #   @resource = resource_class.accept_invitation!(update_resource_params)
  #   ## Report accepting invitation to analytics
  #   Analytics.report('invite.accept', resource.id)
  #   resource
  # end
end