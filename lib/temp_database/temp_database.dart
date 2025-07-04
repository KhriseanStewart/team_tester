import 'package:uuid/uuid.dart';

List<Map<String, dynamic>> customerDetails = [
  {
    'name': 'Khrisean Stewart',
    'c_Number': '8761234567',
    'car_color': 'Colors.red',
    'car_make_model': 'Toyota 2014',
    'date_time': 'null',
    'washer': 'Pam',
    'charged': '1500',
    'vehicleimg': 'intro_image1.jpg',
    'job_stat': 'pending',
    'paid_stat': 'false',
  },
  {
    'name': 'Khrisean Stewart1',
    'c_Number': '8761234567',
    'car_color': 'Colors.red',
    'car_make_model': 'Toyota 2014',
    'date_time': 'null',
    'washer': 'Pam',
    'charged': '1500',
    'vehicleimg': 'intro_image1.jpg',
    'job_stat': 'done',
    'paid_stat': 'false',
  },
  {
    'name': 'Khrisean Stewart2',
    'c_Number': '8761234567',
    'car_color': 'Colors.red',
    'car_make_model': 'Toyota 2014',
    'date_time': 'null',
    'washer': 'Pam',
    'charged': '1500',
    'vehicleimg': 'intro_image1.jpg',
    'job_stat': 'in progress',
    'paid_stat': 'false',
  },
  {
    'name': 'Khrisean Stewart3',
    'c_Number': '8761234567',
    'car_color': 'Colors.red',
    'car_make_model': 'Toyota 2014',
    'date_time': 'null',
    'washer': 'Pam',
    'charged': '1500',
    'vehicleimg': 'intro_image1.jpg',
    'job_stat': 'canceled',
    'paid_stat': 'false',
  },
];
var uuid = Uuid();

List<Map<String, dynamic>> washerManagement = [
  {'name': 'pam', 'uuid': uuid.v1()},
  {'name': 'Rick', 'uuid': uuid.v1()},
];
