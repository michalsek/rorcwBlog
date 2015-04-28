require 'rails_helper'

describe "Category" do 
  let(:category){ FactoryGirl.create :category }
  let!(:post){ FactoryGirl.create :post, categories: [category] }
  let!(:post2){ FactoryGirl.create :post, categories: [category] }
  let!(:post3){ FactoryGirl.create :post}
  
  it "should display good posts" do
    visit category_path(category)
    
    expect(page).to have_content category.name
    expect(page).to have_content post.title
    expect(page).to have_content post2.title
    expect(page).to_not have_content post3.title
  end
end