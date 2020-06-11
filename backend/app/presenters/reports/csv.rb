require 'csv'

module Reports
  class Csv
    include Enumerable

    def initialize(data = [], map = {})
      @data = data
      @map = map
    end

    def each
      yield CSV.generate_line(map.keys) # Headers

      Array(data).each do |d|
        yield CSV.generate_line(d.values_at(*map.values))
      end
    end

    def filename
      "#{prefix}-#{Date.current.to_s(:db)}.csv"
    end

    private

    attr_reader :data, :map

    def prefix
      self.class.name.demodulize.underscore
    end
  end
end
