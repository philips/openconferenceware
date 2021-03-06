require 'activesupport'
require 'fastercsv'
require 'comma/extractors'

class Array
  def to_comma(style = :default)
    FasterCSV.generate do |csv|
      return "" if empty?
      csv << first.to_comma_headers(style)
      each do |object|
        csv << object.to_comma(style)
      end
    end
  end
end

class Object
  class_inheritable_accessor :comma_formats

  def self.comma(style = :default, &block)
    (self.comma_formats ||= {})[style] = block
  end

  def to_comma(style = :default)
    raise "No comma format for class #{self.class} defined for style #{style}" unless self.comma_formats and self.comma_formats[style]
    Comma::DataExtractor.new(self, &self.comma_formats[style]).results
  end

  def to_comma_headers(style = :default)
    raise "No comma format for class #{self.class} defined for style #{style}" unless self.comma_formats and self.comma_formats[style]
    Comma::HeaderExtractor.new(self, &self.comma_formats[style]).results
  end
end

if defined?(ActionController)
  module RenderAsCSV

    def self.included(base)
      base.send :include, InstanceMethods
      base.alias_method_chain :render, :csv
    end

    module InstanceMethods
      def render_with_csv(options = nil, extra_options = {}, &block)
        return render_without_csv(options, extra_options, &block) unless (options.respond_to? '[]') and options[:csv]
        data = options.delete(:csv)
        style = options.delete(:style) || :default
        send_data Array(data).to_comma(style), options.merge(:type => :csv)
      end
    end

  end

  ActionController::Base.send :include, RenderAsCSV
end
