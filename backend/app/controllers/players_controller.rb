class PlayersController < ApplicationController
  include Orderable
  before_action :set_players

  def index
    render_json(serializer, @players.page(params[:page]).per(params[:per_page]), { include: [:team] })
  end

  def download
    respond_to do |format|
      format.csv do
        render csv: Reports::Players.new(@players)
      end
    end
  end

  private

  def set_players
    @players = Player.order(order_by(params[:sort], Player))
                    .includes(:team)
    @players = @players.where("name ilike ?", "%#{params[:search]}%") if params[:search].present?
  end

  def serializer
    PlayerSerializer
  end
end
