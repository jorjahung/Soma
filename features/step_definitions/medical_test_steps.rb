Given(/^I am on the blood test entry page$/) do
  visit new_blood_test_path
end

When(/^I enter the results$/) do
  fill_in 'blood_test[taken_on]', with: '01/01/2014'
  fill_in 'blood_test[hb]', with: '13'            # In range
  fill_in 'blood_test[mcv]', with: '88'           # In range
  fill_in 'blood_test[wbc]', with: '7.0'          # In range
  fill_in 'blood_test[platelets]', with: '278'    # In range
  fill_in 'blood_test[neutrophils]', with: '4.4'  # In range
  fill_in 'blood_test[lymphocytes]', with: '2.2'  # In range
  fill_in 'blood_test[alt]', with: '103'          # Out of range
  fill_in 'blood_test[alk_phos]', with: '67'      # In range
  fill_in 'blood_test[creatinine]', with: '50'    # In range
  fill_in 'blood_test[esr]', with: '9'            # In range
  fill_in 'blood_test[crp]', with: '<5'           # In range
  click_button 'submit'
end

When(/^I (?:enter|have entered) a set of results(?:| that includes an empty value)$/) do
  visit new_blood_test_path
  fill_in 'blood_test[taken_on]', with: '01/01/2014'
  fill_in 'blood_test[hb]', with: '13'
  fill_in 'blood_test[mcv]', with: '88'
  fill_in 'blood_test[wbc]', with: '7.0'
  fill_in 'blood_test[platelets]', with: '278'
  fill_in 'blood_test[neutrophils]', with: '4.4'
  fill_in 'blood_test[lymphocytes]', with: '2.2'
  fill_in 'blood_test[alt]', with: '103'
  fill_in 'blood_test[alk_phos]', with: ''
  fill_in 'blood_test[creatinine]', with: '50'
  fill_in 'blood_test[esr]', with: '9'
  fill_in 'blood_test[crp]', with: '<5'
  click_button 'submit'
end

When(/^I add a new blood test$/) do
  enter_blood('01/01/2013')
end

When(/^fill up the edit form$/) do
  fill_in 'blood_test[hb]', with: '20'
  fill_in 'blood_test[esr]', with: '19'
  fill_in 'blood_test[alk_phos]', with: '67'
  click_button 'submit'
end

When(/^I click "(.*?)"$/) do |link|
  click_link link
end

Then(/^I want to be able to see those results$/) do
  ['Taken on', '01 Jan 2014', 'Hb', '13', 'MCV', '88', 'WBC', '7.0', 'Platelets', '278', 'Neutrophils', '4.4', 'Lymphocytes', '2.2', 'ALT', '103', 'Alk Phos', '67', 'Creatinine', '50', 'ESR', '9', 'CRP', '<5'].each do |string|
    expect(page).to have_content(string)
  end
end

Then(/^I want to see which tests are out of range$/) do
  expect(page).to have_css('.danger', text: '103')
end

Then(/^I want to see which tests are within range$/) do
  expect(page).to have_css('.no-danger', text: '13')
end

Given(/^I have submitted more than one set of results$/) do
  enter_blood('01/01/2013')
  enter_blood('01/01/2012')
  enter_blood('01/01/2014')
end

When(/^I am on the blood test results page$/) do
  visit blood_tests_path
end

Then(/^I should see those results in chronological order$/) do
  first = page.all(:xpath, '//tr/td').first
  last = page.all(:xpath, '//tr').last
  expect(first).to have_content('01 Jan 2014')
  expect(last).to have_content('01 Jan 2012')
end

When(/^I enter two sets of results with the same date$/) do
  enter_blood('01/01/2014')
  enter_blood('01/01/2014')
end

When(/^I don't enter a date$/) do
  enter_blood('')
end

Then(/^I should be on the blood test entry page$/) do
  expect(current_path).to eq(new_blood_test_path)
end

Then(/^I should be on the edit page for that blood test$/) do
  expect(current_path).to eq(edit_blood_test_path(BloodTest.find_by_hb(13).id))
end

Then(/^I should see my changes$/) do
  ['Taken on', '01 Jan 2014', 'Hb', '20', 'MCV', '88', 'WBC', '7.0', 'Platelets', '278', 'Neutrophils', '4.4', 'Lymphocytes', '2.2', 'ALT', '103', 'Alk Phos', '67', 'Creatinine', '50', 'ESR', '19', 'CRP', '<5'].each do |string|
    expect(page).to have_content(string)
  end
end


Then(/^there should be blank cells in the table$/) do
  expect(page).to have_css('.empty-value', text: '')
end

Then(/^I should see "(.*?)"$/) do |message|
  expect(page).to have_content(message)
end

Then(/^I should see my results grouped according to whether or not they are in range$/) do
  expect(current_path).to eq(blood_test_path(BloodTest.find_by_hb(13)))
  expect(page).to have_css('.danger', text: '103')
  expect(page).to have_css('.no-danger', text: '13')
end

def enter_blood(date)
  visit new_blood_test_path
  fill_in 'blood_test[taken_on]', with: date
  fill_in 'blood_test[hb]', with: '13'
  fill_in 'blood_test[mcv]', with: '88'
  fill_in 'blood_test[wbc]', with: '7.0'
  fill_in 'blood_test[platelets]', with: '278'
  fill_in 'blood_test[neutrophils]', with: '4.4'
  fill_in 'blood_test[lymphocytes]', with: '2.2'
  fill_in 'blood_test[alt]', with: '103'
  fill_in 'blood_test[alk_phos]', with: '67'
  fill_in 'blood_test[creatinine]', with: '50'
  fill_in 'blood_test[esr]', with: '9'
  fill_in 'blood_test[crp]', with: '<5'
  click_button 'submit'
end
