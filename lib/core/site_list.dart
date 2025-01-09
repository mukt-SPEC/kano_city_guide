import 'dart:math';

import 'package:kano_city_guide/core/enums.dart';
import 'package:kano_city_guide/model/coordinate.dart';
import 'package:kano_city_guide/model/tourist_site.dart';

List<Touristsite> places = [
  Touristsite(
    coordinate: Coordinate(latitude: 11.990204, longitude: 8.519301),
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
    coordinate: Coordinate(latitude: 11.98884, longitude: 8.520948),
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
  // Touristsite(
  //   placeName: 'Kano State Museum',
  //   category: Category.recreational,
  //   address: '',
  //   placeImages: ['kano state museum.jpg'],
  //   description: '',
  //   userReview: 10 + Random().nextInt(50),
  //   rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  // ),
  Touristsite(
    coordinate: Coordinate(latitude: 12.000742, longitude: 8.525984),
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
    coordinate: Coordinate(latitude: 11.994876, longitude: 8.517598),
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
    coordinate: Coordinate(latitude: 12.018088, longitude: 8.492056),
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
    coordinate: Coordinate(latitude: 12.001453, longitude: 8.492646),
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
    coordinate: Coordinate(latitude: 11.980237, longitude: 8.49584),
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
    coordinate: Coordinate(latitude: 11.981489, longitude: 8.523551),
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
    coordinate: Coordinate(latitude: 11.98884, longitude: 8.520948),
    placeName: 'Kofar Nasarawa',
    category: Category.historicalSites,
    address: ' Kofar Nassarawa, Kano 700103, Kano, Nigeria.',
    placeImages: ['Kofar_Nasarawa_-_Kano_City_Gate.jpg'],
    description:
        'Kofar Nassarawa is one of Kano\'s twelve historic city gates, built centuries ago. It served as a vital entrance to the city and played a crucial role in its defense. Today, Kofar Nassarawa stands as a testament to Kano\'s rich history and architectural heritage, offering a glimpse into the city\'s past. It was originally built in the 15th century during the reign of Sarki Abdullahi Burum Burum. The gate is made of mud and has a large wooden door. It is one of the few remaining city gates of Kano and is a popular tourist destination.',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    coordinate: Coordinate(latitude: 12.026626, longitude: 8.500785),
    placeName: 'Kofar Ruwa',
    category: Category.historicalSites,
    address: 'Kofar Ruwa 700252, Kano, Nigeria.',
    placeImages: ['Kofar_Ruwa_-_Kano_City_Gate.jpg'],
    description:
        'Kofar Ruwa is one of Kano\'s twelve historic city gates, built centuries ago during the reign of Sarki Abdullahi Burum Burum in the 15th century. It served as a vital entrance to the city and played a crucial role in its defense. The name "Kofar Ruwa," which translates to "Gate of Water," likely refers to its proximity to a water source within the city walls. Today, Kofar Ruwa stands as a testament to Kano\'s rich history and architectural heritage, offering a glimpse into the city\'s past. While some of the original structure may have been altered over time, Kofar Ruwa remains a significant landmark and a reminder of Kano\'s ancient past.',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    coordinate: Coordinate(latitude: 12.005703, longitude: 8.521307),
    placeName: 'Kofar Wambai',
    category: Category.historicalSites,
    address: 'Kofar Wambai, Kano',
    placeImages: ['Kofar_Wambai_Bichi.jpg'],
    description:
        'Kofar Wambai, meaning "Gate of the Governor," stands as a testament to Kano\'s rich history. It\'s one of the oldest surviving gates in the city, dating back to the 15th century. Built during the reign of Sarki Abdullahi Buratai, it served as a crucial entry point for travelers and traders entering the city. The gate\'s imposing structure, adorned with intricate mud-brick architecture, reflects the ingenuity of Kano\'s early builders. Kofar Wambai\'s historical significance lies in its role as a witness to centuries of trade, cultural exchange, and the ebb and flow of life within the ancient city walls.',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    coordinate: Coordinate(latitude: 11.9555, longitude: 8.49754),
    placeName: 'Sabuwar Kofar',
    category: Category.historicalSites,
    address: 'Sabuwar kofa, Kofar Dan Agudi, Kano 384831, Kano',
    placeImages: ['Sabuwar_Kofa_-_Kano_City_Gate.jpg'],
    description:
        'Translated as "New Gate," Sabuwar Kofa is a relatively newer addition to Kano\'s historic gates, constructed in the 19th century. It replaced an older gate that had fallen into disrepair. Despite its younger age, Sabuwar Kofa holds a significant place in the city\'s history. It served as a vital entry point for goods and people during the period of increased trade and interaction with the outside world. The gate\'s design reflects the evolving architectural styles of the time while maintaining a connection to the traditional mud-brick construction techniques.',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    placeName: 'Kofar Waika',
    category: Category.historicalSites,
    address: 'Kofar Waika Rd, Kofar Walka, Kano 700282, Kano',
    placeImages: ['Waika_Gate_in_Kano_07.jpg'],
    description:
        'Kofar Waika, meaning "Gate of Waika," is named after the Waika people, a significant ethnic group in the region. This gate played a crucial role in the city\'s defense and trade. Its strategic location provided a vantage point for guarding the city against potential threats. Kofar Waika also served as a gateway for trade with neighboring regions, facilitating the exchange of goods and cultural influences. The gate\'s sturdy construction and its prominent position within the city walls highlight its importance in safeguarding Kano\'s prosperity and cultural identity.',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    coordinate: Coordinate(latitude: 12.015072, longitude: 8.518049),
    placeName: 'Kofar Mazungal',
    category: Category.historicalSites,
    address: 'Kofar Mazugal, Kano',
    placeImages: ['Kofar_Mazugal_-_Kano_City_Gate.jpg'],
    description:
        'Kofar Mazunga, meaning "Gate of Mazunga," is another significant gateway in Kano. It served as an important entry point for travelers and traders arriving from the eastern regions. The gate\'s strategic location facilitated trade routes and connected Kano to a wider network of commercial activity. Kofar Mazunga\'s history is intertwined with the city\'s economic growth and its role as a regional center for trade and commerce. The gate\'s enduring presence serves as a reminder of Kano\'s vibrant past and its continuous evolution as a hub of economic and cultural exchange.',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    coordinate: Coordinate(latitude: 11.966963, longitude: 8.526037),
    placeName: 'Kano Zoo',
    category: Category.zoo,
    address: '138 Zoo Rd, Gadun, Kano 700103, Kan',
    placeImages: ['zoo1.jpg', 'zoo2.jpg', 'zoo3.jpg'],
    description:
        'The Kano Zoo is a popular attraction in Kano, Nigeria, offering visitors a chance to see a variety of animals from around the world. The zoo is open daily from 7:00 AM to 11:00 PM, except on Fridays and Saturdays when it closes at 10:00 PM. It is located at 138 Zoo Rd, Gadun, Kano 700103, Kano, Nigeria.\nThe zoo is home to a variety of animals, including lions, tigers, elephants, monkeys, and birds. There are also a number of reptiles and amphibians on display. The zoo also has a children\'s zoo, where kids can get up close to some of the smaller animals.',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
];
