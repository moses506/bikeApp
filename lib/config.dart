import 'package:app_repo/app_repo.dart';

const initScript = <String>[
  '''
CREATE TABLE users(id INTEGER PRIMARY KEY, firstName TEXT, lastName TEXT, userId INTEGER, otherName TEXT, dateOfBirth TEXT, 
meansOfIdentificationType TEXT, gender TEXT, mobileNumber TEXT, emailAddress TEXT, meansOfIdentificationNumber TEXT

)
  ''',
  '''
CREATE TABLE billboards(id INTEGER PRIMARY KEY, agency TEXT, photo TEXT, 
encoded_photo TEXT, type TEXT, road TEXT, size_id INTEGER, area_id INTEGER, 
face_id INTEGER, latitude REAL, longitude REAL, userId INTEGER, status TEXT, 
inserted_at TEXT, updated_at TEXT)
  ''',
  '''
CREATE TABLE clients(id INTEGER PRIMARY KEY, name TEXT, phone_number TEXT, 
registration_number TEXT, telephone_number TEXT, town TEXT, email TEXT, 
country TEXT, business_type TEXT, address TEXT, incorporation_date TEXT, 
status TEXT, inserted_at TEXT, updated_at TEXT)
  ''',
  '''
CREATE TABLE areas(id INTEGER PRIMARY KEY, name TEXT, code TEXT, status TEXT, 
inserted_at TEXT, updated_at TEXT)
  ''',
  '''
CREATE TABLE sizes(id INTEGER PRIMARY KEY, height TEXT, width TEXT, status TEXT, 
inserted_at TEXT, updated_at TEXT)
  ''',
  '''
CREATE TABLE faces(id INTEGER PRIMARY KEY, number INTEGER, status TEXT, 
inserted_at TEXT, updated_at TEXT)
  ''',
  '''
CREATE TABLE boards(id INTEGER PRIMARY KEY, area_id TEXT, barcodeNo TEXT, 
expiry_date TEXT, face TEXT, last_payment_date TEXT, location_latitude TEXT, location_longitude TEXT, name TEXT, next_payment_date TEXT, payment_amount REAL, payment_frequence TEXT, payment_status TEXT, qrCodeNo TEXT, qrcode_path TEXT, road TEXT, size_id TEXT, start_date TEXT, status TEXT, validity TEXT, validity_type TEXT, image_string TEXT, 
client_id INTEGER, client_name TEXT, nextPaymentDate TEXT, billboard_type TEXT, inserted_at TEXT )
  ''',
  '''
CREATE TABLE transactions(id INTEGER PRIMARY KEY, amount REAL, area_id TEXT, barcodeNo TEXT, billboard_id INTEGER, client_id INTEGER, email TEXT, face_id TEXT, inserted_at TEXT, payment_method TEXT, phone_number TEXT, settlement_status TEXT, size_id TEXT, status TEXT,
transaction_num TEXT, txn_date TEXT, txn_description TEXT, updated_at TEXT, user_id INTEGER  )
  ''',
  '''
CREATE TABLE totalTransactions(id INTEGER PRIMARY KEY, total_count INTEGER, total_value REAL)
'''
];

const migrations = <String>[];

const kDevConfig = Config(
  baseUrl: 'https://192.168.43.2372:6080/api/',
  
  

  dbName: 'paykesho.dev.db',
  host: '192.168.43.2372:6080',
  initScript: initScript,
  // migrations: migrations,
);

const kConfig = Config(
  baseUrl: 'https://192.168.43.2372:6080/api/',
  dbName: 'paykesho.dev.db',
  host: '192.168.43.2372:6080',
  initScript: initScript,
  // migrations: migrations,
);
