module Paging
  extend ActiveSupport::Concern

  def pagination_meta(collection, options = {})    
    options[:meta] = {} unless options.has_key?(:meta)
    options[:meta] = options[:meta].merge(generate_pagination(collection))
    options
  end

  private

  def generate_pagination(collection)
    Hash[
      pagination: Hash[
        current_page: collection.current_page,
        prev_page: collection.prev_page,
        next_page: collection.next_page,
        total_pages: collection.total_pages
      ]
    ]
  end
end
