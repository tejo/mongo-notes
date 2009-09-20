Given /^the note_name$/ do
  @name = 1234567
  @body = 'Bad reputation'

  Note.create({
    :name => @name,
    :body => @body,
  })
  
end

When /^I view the note "([^\"]*)"$/ do |name|
  visit("/notes/#{name}/view")
end

Then /^I should see a  "([^\"]*)"$/ do |note|
  response.body.should have_selector("div", :content => note)
end
