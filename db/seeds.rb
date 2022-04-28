Admin.create!(
                    email: "example@hogehoge.org",
                 password: "hogehoge",
    password_confirmation: "hogehoge",
               created_at: Time.zone.now)

Customer.create!(
              family_name: "Gitt",
               first_name: "Hub太郎",
              family_kana: "ギットト",
               first_kana: "ハブタロウ",
                    email: "mail@gmail.com",
              postal_code: "4325266",
             phone_number: "00078785656",
                  address: "東京都品川区品川1-1-2",
                is_active: "true",
                 password: "123456",
    password_confirmation: "123456",
               created_at: Time.zone.now
                )
Customer.create!(
              family_name: "第二",
               first_name: "顧客",
              family_kana: "ダイニ",
               first_kana: "コキャク",
                    email: "mail1@gmail.com",
              postal_code: "7777777",
             phone_number: "00078785656",
                  address: "京都府すごいところ1-1-2",
                is_active: "true",
                 password: "123456",
    password_confirmation: "123456",
               created_at: Time.zone.now
                )

Genre.create!(
               id: 1,
             name: "甘いやつ",
       created_at: Time.zone.now
              )

Item.create!(
          genre_id: 1,
              name: "すごいケーキ",
              body: "めっちゃ美味しい",
     non_tax_price: 800,
        is_selling: true,
        created_at: Time.zone.now
            )
Item.create!(
          genre_id: 1,
              name: "やばいクッキー",
              body: "それなりに美味しい",
     non_tax_price: 500,
        is_selling: true,
        created_at: Time.zone.now
            )
Item.create!(
          genre_id: 1,
              name: "うれない",
              body: "それなりに美味しい",
     non_tax_price: 500,
        is_selling: false,
        created_at: Time.zone.now
            )
10.times do |n|
Item.create!(
          genre_id: 1,
              name: "ケーキ#{n + 1}",
              body: "めっちゃ美味しい",
     non_tax_price: 800,
        is_selling: true,
        created_at: Time.zone.now
            )
end
CartItem.create!(
       customer_id: 1,
           item_id: 1,
          quantity: 2,
        created_at: Time.zone.now
                )
CartItem.create!(
       customer_id: 1,
           item_id: 2,
          quantity: 3,
        created_at: Time.zone.now
                )

Order.create!(
       customer_id: 1,
       postal_code: "1113333",
           address: "東京",
              name: "YubeChang",
    payment_method: 0,
      trade_status: 0,
     total_payment: 1900,
           postage: 800,
        created_at: Time.zone.now
                )

OrderItem.create!(
          order_id: 1,
           item_id: 2,
             price: 500,
          quantity: 2,
     making_status: 0,
        created_at: Time.zone.now
                )

Address.create!(
     customer_id: 1,
            name: "マージ太郎",
     postal_code: "2224444",
         address: "品川",
      created_at: Time.zone.now
               )
Address.create!(
     customer_id: 1,
            name: "フェッチ花子",
     postal_code: "3335555",
         address: "渋谷",
      created_at: Time.zone.now
               )
Address.create!(
     customer_id: 2,
            name: "プッシュ二郎",
     postal_code: "6668888",
         address: "新宿",
      created_at: Time.zone.now
               )