# encoding: utf-8
require 'spec_helper'

describe TypographyHelper::Parsers::AddClassToFirstParagraph, ' last paragraph parser' do |target|
  before :all do |spec|
    TypographyHelper.register :default, [spec.described_class.new]
  end
  
  it "should add class to first <p>" do
    ty('<div>Not paragraph</div><p>Lorem ipsum</p><p>Second paragraph</p>').should == '<div>Not paragraph</div><p class="first_paragraph">Lorem ipsum</p><p>Second paragraph</p>'
  end
  
  it "should add class to first <p> already with class" do
    ty('<div>Not paragraph</div><p class="old_class">Lorem ipsum</p><p>Second paragraph</p>').should == '<div>Not paragraph</div><p class="old_class first_paragraph">Lorem ipsum</p><p>Second paragraph</p>'
  end

end
