import 'package:flutter/material.dart';

Color lightsky = const Color(0xFFA6C0FF);
Color whiteshade = const Color(0xFFF8F9FA);
Color blue = const Color(0xFF1137FF);
Color lightblueshade = const Color(0xFF758CC8);
Color grayshade = const Color(0xFF9FA4AF);
Color lightblue = const Color(0xFF4B68D1);
Color blackshade = const Color(0xFF555555);
Color defaultColor = const Color(0xff021127);

String carAPIData = '''
  [
  {
    "id": "hs1",
    "name": "Hyndai Sonata 2020",
    "image_url": "https://www.wardsauto.com/sites/wardsauto.com/files/styles/article_featured_retina/public/2020%20Hyundai%20Sonata%20main%20blue%20resized.jpg?itok=8l7TKJ2h",
    "Brand": "Hyndai"
  },
  {
    "id": "hs2",
    "name": "Hyndai Elantra 2021",
    "image_url": "https://www.cnet.com/a/img/resize/c04ff4d7e00e4f669ed109ff24f6e2528320fc3c/hub/2021/03/05/6562dfd2-d038-44b2-8a98-dd4bae1aae3d/2021-hyundai-elantra-sel-1.jpg?auto=webp&width=768",
    "Brand": "Hyndai"
  },
  {
    "id": "hs1",
    "name": "Hyndai Sonata 2020",
    "image_url": "https://www.wardsauto.com/sites/wardsauto.com/files/styles/article_featured_retina/public/2020%20Hyundai%20Sonata%20main%20blue%20resized.jpg?itok=8l7TKJ2h",
    "Brand": "Hyndai"
  },
  {
    "id": "hs2",
    "name": "Hyndai Elantra 2021",
    "image_url": "https://www.cnet.com/a/img/resize/c04ff4d7e00e4f669ed109ff24f6e2528320fc3c/hub/2021/03/05/6562dfd2-d038-44b2-8a98-dd4bae1aae3d/2021-hyundai-elantra-sel-1.jpg?auto=webp&width=768",
    "Brand": "Hyndai"
  },
  {
    "id": "hs1",
    "name": "Hyndai Sonata 2020",
    "image_url": "https://www.wardsauto.com/sites/wardsauto.com/files/styles/article_featured_retina/public/2020%20Hyundai%20Sonata%20main%20blue%20resized.jpg?itok=8l7TKJ2h",
    "Brand": "Hyndai"
  },
  {
    "id": "hs2",
    "name": "Hyndai Elantra 2021",
    "image_url": "https://www.cnet.com/a/img/resize/c04ff4d7e00e4f669ed109ff24f6e2528320fc3c/hub/2021/03/05/6562dfd2-d038-44b2-8a98-dd4bae1aae3d/2021-hyundai-elantra-sel-1.jpg?auto=webp&width=768",
    "Brand": "Hyndai"
  },
  {
    "id": "hs1",
    "name": "Hyndai Sonata 2020",
    "image_url": "https://www.wardsauto.com/sites/wardsauto.com/files/styles/article_featured_retina/public/2020%20Hyundai%20Sonata%20main%20blue%20resized.jpg?itok=8l7TKJ2h",
    "Brand": "Hyndai"
  },
  {
    "id": "hs2",
    "name": "Hyndai Elantra 2021",
    "image_url": "https://www.cnet.com/a/img/resize/c04ff4d7e00e4f669ed109ff24f6e2528320fc3c/hub/2021/03/05/6562dfd2-d038-44b2-8a98-dd4bae1aae3d/2021-hyundai-elantra-sel-1.jpg?auto=webp&width=768",
    "Brand": "Hyndai"
  }
]
''';

String insuranceAPIData = '''
  [
  {
    "id": "is1",
    "phone_no": "1-855-789-9092",
    "image_url": "https://img1.pnghut.com/t/5/4/3/aCDtb3nXhv/insurance-brand-home-ecommerce-payment-system-personal-company.jpg",
    "brand": "AVIVA",
    "description" : "cheap and affordable",
    "hours" : "Mon — Fri 8:00 AM — 8:00 PM",
    "monthly_price" : "\$275.00",
    "yearly_price" : "\$3300.00",
    "reference_number" : "Q015985499"
  },
  {
    "id": "is2",
    "phone_no": "1-855-789-9092",
    "image_url": "https://mma.prnewswire.com/media/1579186/Echelon_Fit_Logo.jpg?p=facebook",
    "brand": "Echelon",
    "description" : "best value for money",
    "hours" : "Mon — Fri 8:00 AM — 8:00 PM",
    "monthly_price" : "\$546.00",
    "yearly_price" : "\$6552.00",
     "reference_number" : "Q1243223332"
  },
  {
    "id": "is2",
    "phone_no": "1-855-789-9092",
    "image_url": "https://mma.prnewswire.com/media/1579186/Echelon_Fit_Logo.jpg?p=facebook",
    "brand": "Echelon",
    "description" : "best value for money",
    "hours" : "Mon — Fri 8:00 AM — 8:00 PM",
    "monthly_price" : "\$546.00",
    "yearly_price" : "\$6552.00",
     "reference_number" : "Q1243223331"
  }
]
''';

String apiUrl = "https://dummy-domain/api/available_cars?offset=";
