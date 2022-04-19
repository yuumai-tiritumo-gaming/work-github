Admin.create!(email: "example@hogehoge.org",
             password: "hogehoge",
             password_confirmation: "hogehoge",
             created_at: Time.zone.now)
Customer.create!(
                family_name:"姓",
                first_name:"名",
                family_kana:"セイ",
                first_kana:"メイ",
                email:"mail@gmail.com",
                postal_code:"1234567",
                phone_number:"1234567898",
                address:"Here",
                is_active:"false",
                password: "123456",
                password_confirmation: "123456",
                created_at: Time.zone.now
                )
                             