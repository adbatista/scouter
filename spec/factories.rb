FactoryGirl.define do
  factory :class_detail do
    class_name "Example"
    score 13
  end

  factory :repository do
    url 'http://example.com/abc.git'
  end
end