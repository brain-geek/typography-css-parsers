# encoding: utf-8
require 'spec_helper'

describe TypographyHelper::Parsers::WrapFirstLetter, ' last paragraph parser' do |target|
  before :all do |spec|
    TypographyHelper.register :default, [spec.described_class.new]
  end
  
  it "should wrap first letter in first <p>" do
    ty('<div>Not paragraph</div><p>Lorem ipsum</p><p>Second paragraph</p>').should == '<div>Not paragraph</div><p><span class="first_letter">L</span>orem ipsum</p><p>Second paragraph</p>'
  end

  it "should wrap first letter in first <p>, starting with tag" do
    ty('<div>Not paragraph</div><p><span></span>Lorem ipsum</p><p>Second paragraph</p>').should == '<div>Not paragraph</div><p><span></span><span class="first_letter">L</span>orem ipsum</p><p>Second paragraph</p>'
  end

  it "should wrap first letter in first <p>, starting with space" do
    ty('<div>Not paragraph</div><p> Lorem ipsum</p><p>Second paragraph</p>').should == '<div>Not paragraph</div><p> <span class="first_letter">L</span>orem ipsum</p><p>Second paragraph</p>'
  end
end
