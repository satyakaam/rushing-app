module Orderable
  extend ActiveSupport::Concern

  ORDER_NOTATIONS = { '+': :asc, '-': :desc }

  def order_by(params, model)
    return unless params.present?

    params.split(',').map do |attribute|
      order = ORDER_NOTATIONS[(attribute =~ /\A[+-]/) ? attribute.slice!(0).to_sym : :'+']
      [attribute, order] if model.attribute_names.include?(attribute)
    end.compact.to_h
  end
end
