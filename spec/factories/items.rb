FactoryBot.define do
  factory :item do
    # image              {  }
    # name               {  }
    # explanation        {  }
    # category_id        {  }
    # status_id          {  }
    # delivery_fee_id    {  }
    # shipping_region_id {  }
    # shipping_day_id    {  }
    # selling_price      {  }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
