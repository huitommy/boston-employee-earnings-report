require 'spec_helper'

feature "User views the index page" do
  scenario "user sees a unique list of all the job titles" do
    visit '/'

    expect(page).to have_content "Personnel Analyst"
    expect(page).to have_content "Prin Admin Asst"
    expect(page).to have_content "Fire Alarm Operator"
  end
end

feature "User views show page for job" do
  scenario "user clicks on a job titles" do
    visit '/'
    click_link 'Clerk'

    expect(page).to have_content "Job titles matching your search"
    expect(page).to have_content "Clerk"
    expect(page).to have_content "Office Clerk"
    expect(page).to have_content "Clerk Of Works"
    expect(page).to have_content "Average Salary"
  end

  scenario "user puts in a title" do
    visit '/teacher'

    expect(page).to have_content "Job titles matching your search"
    expect(page).to have_content "Teacher I"
    expect(page).to have_content "Substitute Teacher"
    expect(page).to have_content "Asst Teacher"
    expect(page).to have_content "Head Teacher"
    expect(page).to have_content "Average Salary"
  end

  scenario "user puts in a title that does not exist" do
    visit '/apples'

    expect(page).to have_content "Job titles matching your search"
    expect(page).to have_content "Average Salary: $ 0.00"
  end
end
