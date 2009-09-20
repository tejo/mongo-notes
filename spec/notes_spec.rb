require "#{File.dirname(__FILE__)}/spec_helper"

describe 'note' do
  before(:each) do
    @note = Note.new(:name => 'test note')
  end

  specify 'should be valid' do
    @note.should be_valid
  end

  specify 'should require a name' do
    @note = Note.new
    @note.should_not be_valid
  end
end
