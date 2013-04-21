module Searchable
  extend ActiveSupport::Concern

  module ClassMethods
    def searchable(fields)
      @search_fields = fields
      Searchable.loaded_classes[self.to_s] = fields
    end

    def search(term, options = {})
      searcher(term, :text, options)
    end

    def more_like(term, options = {})
      searcher(term, :more_like_this_field, options, {min_term_freq: 1, min_doc_freq: 2})
    end

    private

    def searcher(term, type, options = {}, field_options = {})
      fields = Array(@search_fields)

      self.tire.search(options.merge(load: true)) do
        query do
          boolean do
            fields.each do |field|
              should {send(type, field, term, field_options)}
            end
          end
        end
      end.results

    end
  end

  def self.loaded_classes
    @loaded_classes ||= {}
  end

  def self.search(term, options = {})
    Tire.search(Searchable.loaded_classes.keys.collect {|k| k.downcase.pluralize}.reverse, options.merge(load: true)) do
      query do
        boolean do
          Searchable.loaded_classes.values.flatten.uniq.each do |field|
            should {text field, term}
          end
        end
      end
    end.results
  end

end