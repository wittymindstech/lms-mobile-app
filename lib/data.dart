import 'package:WTApp/models/course.dart';
import 'package:flutter/material.dart';
import './models/category.dart';

const CATEGORIES = const [
  Category(
    id: 'c1',
    title: 'Technical',
    color: Colors.purple,
  ),
  Category(
    id: 'c2',
    title: 'Non-Technical',
    color: Colors.red,
  ),
  Category(
    id: 'c3',
    title: 'Kidpreneurs',
    color: Colors.orange,
  ),
];


const COURSE = const [
  Course(
    id: 't1',
    title: 'IOT',
    categories: [
      'c1',
    ],
    url: 'https://iotlist.herokuapp.com/',
    color: Colors.purple,
  ),
  Course(
    id: 't2',
    title: 'Artificial Intelligence',
    categories: [
      'c1',
    ],
    url: 'https://ailist.herokuapp.com/',
    color: Colors.red,
  ),
  Course(
    id: 't3',
    title: 'Linux',
    categories: [
      'c1',
    ],
    url: 'https://linuxlist.herokuapp.com/',
    color: Colors.orange,
  ),
  Course(
    id: 't4',
    title: 'Flutter',
    categories: [
      'c1',
    ],
    url: 'https://ailist.herokuapp.com/',
    color: Colors.blue,
  ),
  Course(
    id: 't5',
    title: 'Polity',
    categories: [
      'c2',
    ],
    url: 'https://ailist.herokuapp.com/',
    color: Colors.red,
  ),
  Course(
    id: 't6',
    title: 'History',
    categories: [
      'c2',
    ],
    url: 'https://ailist.herokuapp.com/',
    color: Colors.blue,
  ),
  Course(
    id: 't7',
    title: 'Poems',
    categories: [
      'c3',
    ],
    url: 'https://ailist.herokuapp.com/',
    color: Colors.blue,
  ),
];
