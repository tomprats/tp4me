class LinksController < ApplicationController
  after_action :create_view, unless: :prefetching

  def show
    @link = Link.find_by(uid: params[:uid])

    redirect_to @link.url
  end

  def random
    @link = Link.random

    redirect_to @link.url
  end

  private
  def prefetching
    false # Impossible to determine server side
  end

  def create_view
    View.create(
      link_id: @link.id,
      raw_data: {
        random: action_name == "random",
        remote_ip: request.remote_ip,
        referrer: request.referrer,
        user_agent: request.user_agent,
        accept_language: request.accept_language
      }
    )
  end
end
