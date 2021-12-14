import 'package:flutter/material.dart';

Color lightsky = const Color(0xFFA6C0FF);
Color whiteshade = const Color(0xFFF8F9FA);
Color blue = const Color(0xFF1137FF);
Color lightblueshade = const Color(0xFF758CC8);
Color grayshade = const Color(0xFF9FA4AF);
Color lightblue = const Color(0xFF4B68D1);
Color blackshade = const Color(0xFF555555);
Color defaultColor = const Color(0xff021127);
final Map<int, Color> _defaultColorMap = {
  50: const Color(0xff021127).withOpacity(0.5),
  100: const Color(0xff021127).withOpacity(0.5),
  200: const Color(0xff021127).withOpacity(0.5),
  300: const Color(0xff021127).withOpacity(0.5),
  400: const Color(0xff021127).withOpacity(0.5),
  500: const Color(0xff021127).withOpacity(0.5),
  600: const Color(0xff021127).withOpacity(0.5),
  700: const Color(0xff021127).withOpacity(0.5),
  800: const Color(0xff021127).withOpacity(0.5),
  900: const Color(0xff021127).withOpacity(0.5),
};

final MaterialColor defaultColorSwatch = MaterialColor(100, _defaultColorMap);

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
String apiUrl = "https://dummy-domain/api/available_cars?offset=";
