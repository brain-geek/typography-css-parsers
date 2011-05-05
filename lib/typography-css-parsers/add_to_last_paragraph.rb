require 'spec_helper'

module TypographyHelper
  module Parsers
    class AddToLastParagraph
      def initialize(options = {})
        @options = options
        @options[:text] ||= ''
        @options[:matcher] ||= 'p:last-of-type'
      end
      
      def parse(string)
        #TODO: swap code after resolving issue https://github.com/tenderlove/nokogiri/issues/454
        #doc = Nokogiri::HTML.fragment(string)
        #doc.css(@options[:matcher]).first.add_child(@options[:text])
        #doc.to_s
        
        doc = Nokogiri.HTML string
        doc.css(@options[:matcher]).first.add_child(@options[:text])
        doc.search('body').children.to_xhtml
      end
    end
  end
end