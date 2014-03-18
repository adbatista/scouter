FactoryGirl.define do
  factory :class_detail do
    class_name "Example"
    score 13
  end

  factory :repository do
    url 'path/example.git'
  end
end