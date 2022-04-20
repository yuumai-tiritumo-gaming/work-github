Admin.create!(
                    email: "example@hogehoge.org",
                 password: "hogehoge",
    password_confirmation: "hogehoge",
               created_at: Time.zone.now)

Customer.create!(
              family_name: "姓",
               first_name: "名",
              family_kana: "セイ",
               first_kana: "メイ",
                    email: "mail@gmail.com",
              postal_code: "1234567",
             phone_number: "1234567898",
                  address: "Here",
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
              name: "すごいケーキ",
              body: "めっちゃ美味しい",
     non_tax_price: 800,
        is_selling: true,
        created_at: Time.zone.now
            )

CartItem.create!(
       customer_id: 1,
           item_id: 1,
          quantity: 2,
        created_at: Time.zone.now
                )