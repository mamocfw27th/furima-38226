FactoryBot.define do
  factory :item do
    
    item_name   {'あ'}
    explanation {'explain'}
    category_id    {2}
    condition_id   {2}
    postage_id     {2}
    area_id        {2}
    arrival_id     {2}
    price       {'9999'}

    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/design.png'), filename: 'design.png')        
    end
    
  end
end