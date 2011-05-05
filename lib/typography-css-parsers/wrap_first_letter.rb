require 'spec_helper'

module TypographyHelper
  module Parsers
    class WrapFirstLetter
      def initialize(options = {})
        @options = options
        @options[:text] ||= Proc.new { |letter| '<span class="first_letter">'+letter+'</span>'}
        @options[:matcher] ||= 'p:first'
      end
      
      def parse(string)
        doc = Nokogiri.HTML string
        target = doc.css(@options[:matcher]).first
        text = target.inner_html
        
        unless text.blank?
          match = /(<([^>]+)>|\s)*(.)/.match text
          new_text_part = @options[:text].call(match[3])
          target.inner_html = text[0...match.offset(3)[0]] + new_text_part + text[match.offset(3)[1]...text.length] 
        end
        
        doc.search('body').children.to_xhtml
      end
    end
  end
end