class Members::HomeController < ApplicationController
  load_and_authorize_resource :thread, :class => Members::HomeController
  def index
    @member = current_user
  end
end
