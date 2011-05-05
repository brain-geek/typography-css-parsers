require 'spec_helper'

module TypographyHelper
  module Parsers
    class AddClassToFirstParagraph
      def initialize(options = {})
        @options = options
        @options[:class] ||= 'first_paragraph'
        @options[:matcher] ||= 'p'
      end
      
      def parse(string)
        doc = Nokogiri.HTML string
        target = doc.css(@options[:matcher]).first
        target['class'] = target['class'].blank? ? @options[:class] : target['class'] + ' ' + @options[:class]
        doc.search('body').children.to_xhtml
      end
    end
  end
end