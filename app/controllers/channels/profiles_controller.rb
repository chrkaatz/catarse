class Channels::ProfilesController < Channels::BaseController
  layout :user_catarse_bootstrap
  add_to_menu 'channels.adm.profile_menu', :edit_channels_profile_path
  inherit_resources
  actions :show, :edit, :update
  custom_actions resource: [:how_it_works]

  before_action only: [:edit, :update] do
    authorize!(params[:action], resource)
  end

  def resource
    @profile ||= channel
  end

  private
  def user_catarse_bootstrap
    action_name == 'edit' ? 'application' : 'catarse_bootstrap'
  end
end
