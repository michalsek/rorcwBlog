# requests/posts_spec.rb
require 'rails_helper'

describe "Posts" do 
  it "should have title Blog" do
    visit posts_path
    expect(page).to have_content("Blog")
  end

  let!(:post){ Post.create title: "To jest super wpis", content: "Super content" }
  
  it "should display good post" do
    visit posts_path

    expect(page).to have_content post.title
    expect(page).to have_content "Pokaż"
  end

  it "should open post page" do
    visit posts_path
    
    expect(page).to have_content "Pokaż"
    click_link "Pokaż"
    
    expect(current_path).to eq post_path(post)
    expect(page).to have_content post.title
    expect(page).to have_content "#{post.created_at.strftime "%d-%m-%Y"}"
  end
  
	it "should display comments " do
    com1 = post.comments.create name: "Jurek", message: "Super"
    com2 = post.comments.create name: "Zosia", message: "Ekstra"
    
    visit post_path(post)
    
    expect(page).to have_content post.title
    expect(page).to have_content com1.message
    expect(page).to have_content com2.message
    expect(page).to have_content com1.name
    expect(page).to have_content com2.name
    expect(page).to have_content "#{com1.created_at.strftime "%d-%m-%Y"}"
    expect(page).to have_content "#{com2.created_at.strftime "%d-%m-%Y"}"
  end

  it "should add comment" do
    visit post_path(post)
    
    fill_in :comment_name, with: "Marysia"
    fill_in :comment_message, with: "co to?"
    expect{
      click_on "Komentuj"
    }.to change{ post.comments.count }.by(1)
    
    expect(current_path).to eq post_path(post)
    expect(page).to have_content "Komentarz został dodany"
    expect(page).to have_content "Marysia"
    expect(page).to have_content "co to?"
  end

  let!(:post){ Post.create title: "To jest super wpis", content: "Super content" }
  let(:post2){ Post.create title: "To jest jeszcze lepszy wpis", content: "Super content 2" }
  
  it "should display all posts with comments" do
    com1 = post.comments.create name: "Jurek", message: "Super"
    com2 = post.comments.create name: "Ewelinka", message: "Ekstra"
    com3 = post2.comments.create name: "Marysia", message: "Tak to jest"
    
    visit all_posts_path
    
    expect(page).to have_content post.title
    expect(page).to have_content post2.title
    expect(page).to have_content post.content
    expect(page).to have_content post2.content
    
    expect(page).to have_content com1.name
    expect(page).to have_content com1.message
    expect(page).to have_content com2.name
    expect(page).to have_content com2.message
    expect(page).to have_content com3.name
    expect(page).to have_content com3.message
    
  end

  it "should filter adults only content" do
    post = FactoryGirl.create :post, content: "To jest framgent wulgarnego tekstu, kurcze!"
    
    visit post_path(post)
    expect(current_path).to eq post_path(post)
    expect(page).to have_content post.title
    expect(page).to_not have_content post.content
    expect(page).to have_content "Tylko dla dorosłych!"
  end

  it "should delete post with all comments" do
    com1 = post.comments.create name: "Jurek", message: "Super"
    com2 = post.comments.create name: "Ewelinka", message: "Ekstra"
    com3 = post.comments.create name: "Marysia", message: "Tak to jest"
    
    visit posts_path
    expect(page).to have_content "Usuń"
    
    expect{
      click_on "Usuń"
    }.to change{ Comment.count }.from(3).to(0)
  end
  
  it "should add post with categories" do
    category1 = FactoryGirl.create :category
    category2 = FactoryGirl.create :category
    category3 = FactoryGirl.create :category
    
    visit new_post_path
    fill_in :post_title, with: "Chwytliwy tytuł"
    fill_in :post_content, with: "Nowa super Treść"
    
    select category2.name, from: :post_category_ids
    select category3.name, from: :post_category_ids
    
    click_on "Zapisz"
    post = Post.last
    expect(current_path).to eq post_path(post)
    expect(page).to have_content "Chwytliwy tytuł"
    expect(page).to_not have_content category1.name
    expect(page).to have_content category2.name
    expect(page).to have_content category3.name
    
    expect(post.categories.length).to eq 2
    expect(post.categories).to_not include(category1)
    expect(post.categories).to include(category2)
    expect(post.categories).to include(category3) 
  end
end

