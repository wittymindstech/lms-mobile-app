import 'package:WTApp/models/course.dart';
import 'package:flutter/material.dart';
import '../models/category.dart';
import 'images.dart';

const CATEGORIESITEM = const [
  Category(
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    name: 'Technical',
    startColor: Color(0xffF74072),
    endColor: Color(0xff8E51E4),
    isLeft: false,
    image: MyImage.cpuImg,
    id: 'c1',
    subCatDescription: "This is New Thing",
  ),
  Category(
    description: "Sed do eiusmod tempor incididunt ut labore.",
    name: "Non Technical",
    startColor: Color(0xFFFFA62B),
    endColor: Color(0xFFFF6513),
    isLeft: true,
    image: MyImage.techImg,
    id: 'c2',
    subCatDescription: "This is New Thing",
  ),
  Category(
    description: "Ut enim ad minim veniam quis nostrud voluptate.",
    name: "News Feed",
    startColor: Color(0xFF6a11cb),
    endColor: Color(0xFF2575fc),
    isLeft: false,
    image: MyImage.newsImg,
    id: 'c3',
    subCatDescription: "This is New Thing",
  ),
];

const SubCatCOURSE = const [
  Course(
    image: MyImage.iotImg,
    id: 't1',
    title: 'IOT',
    categories: [
      'c1',
    ],
    url: 'https://iotlist.herokuapp.com/',
    color: Colors.purple,
    description: "Lorem ipsum dolor sit amet",
  ),
  Course(
    image: MyImage.aiImg,
    id: 't2',
    title: 'Artificial Intelligence',
    categories: [
      'c1',
    ],
    url: 'https://ailist.herokuapp.com/',
    color: Colors.red,
    description: "consectetur adipiscing elit",
  ),
  Course(
    image: MyImage.linuxImg,
    id: 't3',
    title: 'Linux',
    categories: [
      'c1',
    ],
    url: 'https://linuxlist.herokuapp.com/',
    color: Colors.orange,
    description: "Mauris id fermentum quam",
  ),
  Course(
    image: MyImage.iotImg,
    id: 't4',
    title: 'Flutter',
    categories: [
      'c1',
    ],
    url: 'https://ailist.herokuapp.com/',
    color: Colors.blue,
    description: "et auctor magna Vivamus",
  ),
  Course(
    image: MyImage.iotImg,
    id: 't5',
    title: 'Polity',
    categories: [
      'c2',
    ],
    url: 'https://ailist.herokuapp.com/',
    color: Colors.red,
    description: "id tincidunt quam Proin",
  ),
  Course(
      image: MyImage.historyImg,
      id: 't6',
      title: 'History',
      categories: [
        'c2',
      ],
      url: 'https://ailist.herokuapp.com/',
      color: Colors.blue,
      description: "vel sem lobortis, mollis augue"),
  Course(
    image: MyImage.poemImg,
    id: 't7',
    title: 'Poems',
    categories: [
      'c3',
    ],
    url: 'https://ailist.herokuapp.com/',
    color: Colors.blue,
    description: "dignissim sollicitudin sit amet ac sem",
  ),
];
