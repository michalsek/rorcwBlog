FactoryGirl.define do 
	factory :post do
		sequence(:title){ |n| "Tytuł #{n}" }
		sequence(:content){ |n| "Treść #{n}" }
	end
end