import 'package:WTApp/models/course.dart';
import 'package:flutter/material.dart';
import './models/category.dart';

const CATEGORIES = const [
  Category(
    id: 'c1',
    title: 'Media',
    color: Colors.purple,
  ),
  Category(
    id: 'c2',
    title: 'Entertainment',
    color: Colors.red,
  ),
  Category(
    id: 'c3',
    title: 'Education',
    color: Colors.orange,
  ),
];

const COURSE = const [
  Course(
    id: 't1',
    title: 'Technical',
    categories: [
      'c1',
    ],
    url: 'https://iotlist.herokuapp.com/',
    color: Colors.purple,
  ),
  Course(
    id: 't2',
    title: 'Political',
    categories: [
      'c1',
    ],
    url: 'https://ailist.herokuapp.com/',
    color: Colors.red,
  ),
  Course(
    id: 't3',
    title: 'Current affairs',
    categories: [
      'c1',
    ],
    url: 'https://linuxlist.herokuapp.com/',
    color: Colors.orange,
  ),
  Course(
    id: 't4',
    title: 'Environmental',
    categories: [
      'c1',
    ],
    url: 'https://ailist.herokuapp.com/',
    color: Colors.blue,
  ),
  Course(
    id: 't5',
    title: 'Theare',
    categories: [
      'c2',
    ],
    url: 'https://ailist.herokuapp.com/',
    color: Colors.red,
  ),
  Course(
    id: 't6',
    title: 'Short Movies',
    categories: [
      'c2',
    ],
    url: 'https://ailist.herokuapp.com/',
    color: Colors.blue,
  ),
  Course(
    id: 't6',
    title: 'Talent show',
    categories: [
      'c2',
    ],
    url: 'https://ailist.herokuapp.com/',
    color: Colors.blue,
  ),
  Course(
    id: 't7',
    title: 'School - 10th, 12th',
    categories: [
      'c3',
    ],
    url: 'https://ailist.herokuapp.com/',
    color: Colors.blue,
  ),
  Course(
    id: 't8',
    title: 'College',
    categories: [
      'c3',
    ],
    url: 'https://ailist.herokuapp.com/',
    color: Colors.blue,
  ),
  Course(
    id: 't9',
    title: 'Higher education',
    categories: [
      'c3',
    ],
    url: 'https://ailist.herokuapp.com/',
    color: Colors.blue,
  ),
  Course(
    id: 't10',
    title: 'Technical',
    categories: [
      'c3',
    ],
    url: 'https://ailist.herokuapp.com/',
    color: Colors.blue,
  ),
  Course(
    id: 't11',
    title: 'Non Technical',
    categories: [
      'c3',
    ],
    url: 'https://ailist.herokuapp.com/',
    color: Colors.blue,
  ),
    Course(
    id: 't12',
    title: 'Commerce',
    categories: [
      'c3',
    ],
    url: 'https://ailist.herokuapp.com/',
    color: Colors.blue,
  ),
];
