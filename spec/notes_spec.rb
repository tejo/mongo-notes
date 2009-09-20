require "#{File.dirname(__FILE__)}/spec_helper"

describe 'note' do
  before(:each) do
    @note = Note.new(:name => 'test note')
    @note.save
  end
  
  specify 'should be one note in db' do
    Note.count.should == 1
  end
  
  specify 'should be valid' do
    @note.should be_valid
  end

  specify 'should require a name' do
    @note = Note.new
    @note.should_not be_valid
  end
end

describe 'category' do
  before(:each) do
    @category = Category.new(:name => 'test category')
  end

  specify 'should be valid' do
    @category.should be_valid
  end

  specify 'should require a name' do
    @category = Category.new
    @category.should_not be_valid
  end
end

describe 'category with one note' do
  before(:each) do
    @category = Category.new(:name => 'test category')
    @category.notes << Note.new(:name => 'test note')
  end

  specify 'should be valid' do
    @category.should be_valid
  end

  specify 'should see a note named: test note ' do
    @category.notes.first.name.should == 'test note'
  end
end
