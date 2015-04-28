require 'rails_helper'

describe "Category" do 
  let(:category){ FactoryGirl.create :category }
  let!(:post1){ FactoryGirl.create :post, categories: [category] }
  let!(:post2){ FactoryGirl.create :post, categories: [category] }
  let!(:post3){ FactoryGirl.create :post}
  
  it "should display good posts" do
    expect(category.posts.count).to eq 2
    expect(category.posts).to include(post1)
    expect(category.posts).to include(post2)
    expect(category.posts).to_not include(post3)
  end
end