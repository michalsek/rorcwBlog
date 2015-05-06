#model/post_spec.rb
require 'rails_helper'

describe 'Post' do
	let!(:post){ FactoryGirl.create :post }
  let!(:post2){ FactoryGirl.create :post }
  
  # it "should have good title" do
  #   expect(post.title).to eq "Tytuł 1"
  #   expect(post.content).to eq "Treść 1"
    
  #   expect(post2.title).to eq "Tytuł 2"
  #   expect(post2.content).to eq "Treść 2"
  # end

  #  it "should display good recent posts" do
  #   post3 = FactoryGirl.create :post
  #   post4 = FactoryGirl.create :post
    
  #   expect(Post.recent.length).to eq 3
  #   expect(Post.recent).to_not include(post)
  #   expect(Post.recent).to include(post4)
  #   expect(Post.recent).to include(post3)
  #   expect(Post.recent).to include(post2)
  #   expect(Post.recent.first).to eq post4
    
  # end

  # it "should mark post as adults only" do
  #   post1 = FactoryGirl.create :post, content: "To jest framgent wulgarnego tekstu, kurcze!"
  #   post2 = FactoryGirl.create :post, content: "Kurcze, kto głosował na tego jełopa!"
  #   post3 = FactoryGirl.create :post, content: "Całkiem przyzwoity teksty"
    
  #   expect(post1).to be_adults_only
  #   expect(post2).to be_adults_only
  #   expect(post3).to_not be_adults_only
  # end
end

require 'rails_helper'

describe "Posts" do 
 


end