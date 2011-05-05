# encoding: utf-8
require 'spec_helper'

describe TypographyHelper::Parsers::AddToLastParagraph, ' last paragraph parser' do 
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::TagHelper

  it "should add to last paragraph" do |spec|
    TypographyHelper.register :t, [spec.described_class.new(:text => 'ADDED')]
    ty('<p>Lorem ipsum</p><p>Second paragraph</p><div>Not paragraph</div>', :t).should == '<p>Lorem ipsum</p><p>Second paragraphADDED</p><div>Not paragraph</div>'
  end
end
