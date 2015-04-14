# requests/posts_spec.rb
require 'rails_helper'

describe "Posts" do 
  it "should have title Super blog" do
    visit posts_path
    expect(page).to have_content("Super blog")
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
    expect(page).to have_content "Dodano: #{post.created_at.strftime "%F"}"
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
    expect(page).to have_content "Dodano: #{com1.created_at.strftime "%F"}"
    expect(page).to have_content "Dodano: #{com2.created_at.strftime "%F"}"
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
end

