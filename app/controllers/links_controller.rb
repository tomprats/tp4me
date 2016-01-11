class LinksController < ApplicationController
  before_action :authenticate, only: [:create, :show, :update, :destroy]
  before_action :set_link, only: [:show, :update, :destroy]

  after_action :create_view, only: [:go, :random], unless: :prefetching

  def go
    @link = Link.find_by(uid: params[:uid])

    redirect_to @link.url
  end

  def random
    @link = Link.random

    redirect_to @link.url
  end

  # Admin
  def create
    @link = Link.create(link_params)

    render json: { link: @link, errors: @link.errors }
  end

  def show
    render json: { link: @link }
  end

  def update
    @link.update(link_params)

    render json: { link: @link, errors: @link.errors }
  end

  def destroy
    @link.destroy

    render json: { link: @link }
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

  def link_params
    params.require(:link).permit(:uid, :url)
  end

  def set_link
    @link = Link.find_by(uid: params[:uid])

    head 404 unless @link
  end
end
