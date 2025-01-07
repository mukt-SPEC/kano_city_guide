import 'dart:math';

import 'package:kano_city_guide/core/enums.dart';
import 'package:kano_city_guide/model/tourist_site.dart';

List<Touristsite> places = [
  Touristsite(
    placeName: 'Emir Palace',
    category: Category.historicalSites,
    address: 'Emir\'s Palace Rd, Kano City, Kano 700103, Nigeria',
    placeImages: [
      'Emirs_Palace_Kano.jpg',
      'Palace_of_the_Emir_of_Kano_(Nigeria).jpg'
    ],
    description:
        'Beyond its architectural splendor, the Emir\'s Palace holds immense cultural significance. It serves as a symbol of the Emirate\'s power, tradition, and identity. Exploring its grounds provides insights into the rich tapestry of Kano\'s history and the enduring legacy of its royal lineage.',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    placeName: 'Gidan Makama',
    category: Category.musuem,
    address: ' Emir Palace Rd, Wudilawa, Kano 700103, Kano, Nigeria.',
    placeImages: [
      'Gidan_Makama_Museum.jpg',
      'Gidan_Makama_Mesuem-_Kano.jpg',
      'Gidan_makama_Museum_29.jpg',
      'Gidan_Makama_Museum_fence.jpg',
      'Gidan_Makama_Museum_War_tools.jpg',
      'Gidan_Makama_Top_View.jpg',
      'Gidanmakamamosque.jpg',
    ],
    description:
        'Gidan Makama Museum, a 15th-century palace-turned-museum, offers a captivating journey through Kano\'s history. Explore exhibits showcasing the city\'s statehood, the 19th century, and the Civil War. Discover traditional crafts, musical instruments, and delve into Kano\'s cultural and economic past.',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    placeName: 'Kano State Museum',
    category: Category.recreational,
    address: '',
    placeImages: ['kano state museum.jpg'],
    description: '',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    placeName: 'Kofar Mata Dye Pit',
    category: Category.historicalSites,
    address: '2G2G+79Q, Kofar Mata, Kano 700114, Nigeria',
    placeImages: [
      'Dye_pits_in_the_heart_of_the_sahara.jpg',
      'Dyepit.jpg',
      'Kofar_mata_dye_pit_1.jpg',
      'Kofar_Mata_Dye_Pit_since_1498.jpg'
    ],
    description:
        'Kofar Mata, meaning Women\'s Gate, is a historic district in Kano, Nigeria, famous for its centuries-old indigo dye pits. Established in 1498, these pits are among the oldest and last of their kind in Africa. Local artisans continue to use traditional techniques to create beautiful, deep blue fabrics using locally sourced ingredients. Witnessing the artisans at work, their hands dyed a deep indigo, is a captivating experience. Kofar Mata offers a glimpse into Kano\'s rich history and traditions.',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    placeName: 'Kano Central Mosque',
    category: Category.historicalSites,
    address: 'XGV9+W2M, Emir Palace Rd, Kano City, Kano 700103, Kano, Nigeria',
    placeImages: [
      'The_Kano_Central_Mosque.jpg',
      'The_Gate_of_Kano_Central_Mosque.jpg',
    ],
    description:
        'The Kano Central Mosque, also known as the Great Mosque of Kano, is a prominent landmark in the city of Kano, Nigeria. It is one of the oldest and most important mosques in the country, dating back to the 15th century. The mosque is known for its distinctive architecture, featuring a tall minaret and a large dome. It is an important place of worship for Muslims in Kano and a popular tourist destination.',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    placeName: 'Dawanu Gate',
    category: Category.historicalSites,
    address: ' 2F9R+6R6, Kofar Waika Rd, Kofar Walka, Kano 700252, Nigeria.',
    placeImages: ['dawanu_gate_01.jpg', 'dawanu_gate_02.jpg'],
    description:
        'Kofar Dawanau is one of Kano\'s twelve historic city gates, built in the 15th century during the reign of Sarki Abdullahi Burum Burum. This mud-walled gate, featuring a large wooden door, stands as a testament to Kano\'s rich history. Located near the bustling Dawanau market, one of West Africa\'s largest markets, Kofar Dawanau remains a significant landmark and a popular spot for photos.',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    placeName: 'Goran Dutse',
    category: Category.historicalSites,
    address: 'Dala Hill, Kano City, Kano 700212, Nigeria.',
    placeImages: [
      'Goran_Dutse_Hill_Kano_State_03.jpg',
      'Goron_Dutse_Hill_Kano.jpg'
    ],
    description:
        'Goran Dutse, also known as Dalla Hill, is a prominent landmark in Kano, Nigeria. It is believed to be one of the oldest settlements in the city, and it offers stunning panoramic views of the surrounding area. The hill is known for its historical significance and its association with the legend of Bagauda, the founder of Kano. It is a popular destination for tourists and locals alike.',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    placeName: 'Gadon Kaya',
    category: Category.historicalSites,
    address: ' BUK Road, Kofar Bompai, Kano 700271, Kano, Nigeria.',
    placeImages: ['Gadon_Ƙaya_Gate_in_Kano_03.jpg'],
    description:
        'Kofar Gadon Kaya is one of Kano\'s twelve historic city gates, serving as a significant landmark and a gateway to the city\'s rich past. Built centuries ago, it stands as a testament to Kano\'s architectural heritage and the ingenuity of its builders. The gate, with its imposing structure and intricate details, offers a glimpse into the city\'s history and the daily life of its people. It\'s a popular spot for photos and a reminder of Kano\'s enduring legacy.',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    placeName: 'Kofar Dan_Agundi',
    category: Category.historicalSites,
    address: 'Kofar Dan Agudi, Kano 700103, Kano, Nigeria.',
    placeImages: ['Kofar_Dan_Agundi_-_partially_collapsed.jpg'],
    description:
        'Kofar Dan Agundi is one of Kano\'s twelve historic city gates, serving as a significant landmark and a gateway to the city\'s rich past. Built centuries ago, it stands as a testament to Kano\'s architectural heritage and the ingenuity of its builders. The gate, with its imposing structure and intricate details, offers a glimpse into the city\'s history and the daily life of its people. It\'s a popular spot for photos and a reminder of Kano\'s enduring legacy.',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  // Touristsite(
  //   placeName: 'Kofar Naisa',
  //   category: Category.historicalSites,
  //   address: '',
  //   placeImages: ['Kofar_Naisa_-_Kano_City_Gate.jpg'],
  //   description:
  //       'Kofar Na\'isa is one of Kano\'s twelve historic city gates, built during the reign of Muhammadu Rumfa in the 15th century. It served as a vital entrance to the city and played a crucial role in its defense. Today, Kofar Na\'isa stands as a testament to Kano\'s rich history and architectural heritage, offering a glimpse into the city\'s past.',
  //   userReview: 10 + Random().nextInt(50),
  //   rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  // ),
  Touristsite(
    placeName: 'Kofar Nasarawa',
    category: Category.historicalSites,
    address: '',
    placeImages: ['Kofar_Nasarawa_-_Kano_City_Gate.jpg'],
    description: '',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    placeName: 'Kofar Ruwa',
    category: Category.historicalSites,
    address: '',
    placeImages: ['Kofar_Ruwa_-_Kano_City_Gate.jpg'],
    description: '',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    placeName: 'Kofar Wambai',
    category: Category.historicalSites,
    address: '',
    placeImages: ['Kofar_Wambai_Bichi.jpg'],
    description: '',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    placeName: 'Sabuwar Kofar',
    category: Category.historicalSites,
    address: '',
    placeImages: ['Sabuwar_Kofa_-_Kano_City_Gate.jpg'],
    description: '',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    placeName: 'Kofar Waika',
    category: Category.historicalSites,
    address: '',
    placeImages: ['Waika_Gate_in_Kano_07.jpg'],
    description: '',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    placeName: 'Kofar Mazungal',
    category: Category.historicalSites,
    address: '',
    placeImages: ['Kofar_Mazugal_-_Kano_City_Gate.jpg'],
    description: '',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
];
