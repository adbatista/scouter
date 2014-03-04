FactoryGirl.define do
  factory :method_detail do
    sequence :detail do |n|
      "Example#method_#{n} 121"
    end
  end

  factory :repository do
    url 'path/example.git'
    score 1.4
  end
end