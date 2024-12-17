import 'dart:math';

import 'package:kano_city_guide/core/enums.dart';
import 'package:kano_city_guide/model/tourist_site.dart';

List<Touristsite> places = [
  Touristsite(
    placeName: 'Emir Palace',
    category: Category.historicalSites,
    address: '',
    placeImages: [
      'Emirs_Palace_Kano.jpg',
      'Palace_of_the_Emir_of_Kano_(Nigeria).jpg'
    ],
    description: '',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    placeName: 'Gidan Makamam',
    category: Category.musuem,
    address: '',
    placeImages: [
      'Gidan_Makama_Museum.jpg',
      'Gidan_Makama_Mesuem-_Kano.jpg',
      'Gidan_makama_Museum_29.jpg',
      'Gidan_Makama_Museum_fence.jpg',
      'Gidan_Makama_Museum_War_tools.jpg',
      'Gidan_Makama_Top_View.jpg',
      'Gidanmakamamosque.jpg',
    ],
    description: '',
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
    address: '',
    placeImages: [
      'Dye_pits_in_the_heart_of_the_sahara.jpg',
      'Dyepit.jpg',
      'Kofar_mata_dye_pit_1.jpg',
      'Kofar_Mata_Dye_Pit_since_1498.jpg'
    ],
    description: '',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    placeName: 'Kano Central Mosque',
    category: Category.historicalSites,
    address: '',
    placeImages: [
      'The_Kano_Central_Mosque.jpg',
      'The_Gate_of_Kano_Central_Mosque.jpg',
    ],
    description: '',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    placeName: 'Dawanu Gate',
    category: Category.historicalSites,
    address: '',
    placeImages: ['dawanu_gate_01.jpg', 'dawanu_gate_02.jpg'],
    description: '',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    placeName: 'Goran Dutse',
    category: Category.historicalSites,
    address: '',
    placeImages: [
      'Goran_Dutse_Hill_Kano_State_03.jpg',
      'Goron_Dutse_Hill_Kano.jpg'
    ],
    description: '',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    placeName: 'Gadon Kaya',
    category: Category.historicalSites,
    address: '',
    placeImages: ['Gadon_Ƙaya_Gate_in_Kano_03.jpg'],
    description: '',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    placeName: 'Kofar Dan_Agundi',
    category: Category.historicalSites,
    address: '',
    placeImages: ['Kofar_Dan_Agundi_-_partially_collapsed.jpg'],
    description: '',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
  Touristsite(
    placeName: 'Kofar Naisa',
    category: Category.historicalSites,
    address: '',
    placeImages: ['Kofar_Naisa_-_Kano_City_Gate.jpg'],
    description: '',
    userReview: 10 + Random().nextInt(50),
    rating: 1 + double.parse((Random().nextDouble() * 4).toStringAsFixed(1)),
  ),
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