class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include Paging

  def render_json(serializer, collection, options={})
    options = pagination_meta(collection, options)

    render json: serializer.new(collection, options).serializable_hash
  end
end
