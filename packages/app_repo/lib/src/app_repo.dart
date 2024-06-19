import 'dart:async';

import 'dart:developer';

import 'package:app_repo/src/models/models.dart';

import 'package:local_data_source/local_data_source.dart';

import 'package:network_api/network_api.dart';

/// Authentication statuses

enum AuthStatus {
  /// on startup, the authentication status of the user is unknown by default

  unknown,

  /// The status after a user is successfully authenticated

  authenticated,

  /// The status of a user after logging out or before logging in

  unauthenticated,
}

/// {@template app_repo}

/// A repository to handle application authentication.

/// {@endtemplate}

class AppRepo {
  /// {@macro app_repo}

  AppRepo._(
    this._config,
  );

  final Config _config;

  /// final Config _payConfig;

  static Future<AppRepo> init({
    required Config config,
  }) async {
    final repo = AppRepo._(config);

    await repo._init();

    return repo;
  }

  Future<void> _init() async {
    _db = await LocalDataSource.init(
      dbName: _config.dbName,
      initialScript: _config.initScript,
      migrations: _config.migrations,
    );

    _prefs = await SharedPrefs.init();

    await initNetworkApi();
  }

  /// Initialise network api with most recent token

  Future<void> initNetworkApi({String? token}) async {
    token ??= await _prefs.getString(_keyToken);

    _net = await NetworkApi.init(
      baseUrl: _config.baseUrl,
      host: _config.host,
      token: token,
    );
  }

  // table names

  final String _tableUsers = 'users';

  // final String _tableBillboards = 'billboards';

  final String _tableClients = 'clients';

  final String _tableSizes = 'sizes';
  final String _tableProducts = 'products';

  final String _tableTotal = 'totalTransactions';
  final String _tableMerchants = 'merchants';
  final String _tableTrans = 'transactions';
  final String _tableBio = 'bio';

  final String _tableRole = 'role';

  final String _tableBalance = 'balance';
  // Shared preferences keys

  final String _keyUserId = 'user_id';

  final String _keyBioId = 'bio_id';

  final String _keyRoleId = 'role_id';

  final String _keyUserChanged = 'user_changed';

  final String _keyTheme = 'theme';

  final String _keyToken = 'token';

  final String _keyLoggedIn = 'logged_in';

  late LocalDataSource _db;

  late NetworkApi _net;

  late SharedPrefs _prefs;

  // Future<void> _init() async {

  //   _db = await LocalDataSource.init(

  //       dbName: _config.dbName,

  //       initialScript: _config.initScript,

  //       migrations: _config.migrations);

  //   _prefs = await SharedPrefs.init();

  //   _net = NetworkApi(base: _config.host, baseUrl: _config.baseUrl);

  //   _payNetApi = PayNetApi(baseHost: _config.host, baseUrl: _config.baseUrl);

  // }

  final _controller = StreamController<AuthStatus>.broadcast();

  /// Authentication status of user at any given point

  Stream<AuthStatus> get status async* {
    final isLoggedIn = await _checkLoggedIn();

    yield isLoggedIn ? AuthStatus.authenticated : AuthStatus.unauthenticated;

    yield* _controller.stream;
  }

  final _themeController = StreamController<int>();

  /// Theme of the app

  Stream<int> get theme async* {
    final appTheme = await _prefs.getInt(
      _keyTheme,
      defaultValue: 0,
    );

    yield appTheme!;

    yield* _themeController.stream;
  }

  late StreamSubscription<int> _progressSub;

  final _progressController = StreamController<int>.broadcast();

  /// The progress of an upload

  Stream<int> get uploadProgress async* {
    yield 0;

    yield* _progressController.stream;
  }

  /// Set the app theme

  Future<void> setTheme(int themeMode) async {
    await _prefs.set(_keyTheme, themeMode);

    _themeController.add(themeMode);
  }

  Future<bool> _checkLoggedIn() async {
    final isLoggedIn = await _prefs.getInt(_keyUserId);

    return isLoggedIn != null;
  }

  /// Fetch initial app data

  FutureOr<void> initData() async {
    await ferctchBanks();

    await fertchloans();
  }

  /// Gets billboard clients from the server

  Future<OpStatus> fetchClients() async {
    try {
      final response = await _net.get('Get/Client/List');

      if (response.isSuccessful()) {
        final list = response.data as List;

        final data = list.map((e) => Client.toMap(e as JsonMap)).toList();

        await _db.insertAll(_tableClients, data);
      }

      return OpStatus.fromResponse(response);
    } catch (e) {
      log('getClients error: $e');

      return OpStatus.error(e.toString());
    }
  }

  /// Get all clients from database

  Future<List<Client>> getClients() async {
    final elements = await _db.getAll(_tableClients);

    return elements.map(Client.fromJson).toList();
  }

  /// Gets billboard faces from the server

  /// Gets billboard sizes from the server

  Future<OpStatus> fetchSizes() async {
    try {
      final response = await _net.get('Get/Size/List');

      if (response.isSuccessful()) {
        final list = response.data as List;

        final data = list.map((e) => AdSize.toMap(e as JsonMap)).toList();

        await _db.insertAll(_tableSizes, data);
      }

      return OpStatus.fromResponse(response);
    } catch (e) {
      log('getSizes error: $e');

      return OpStatus.error(e.toString());
    }
  }

  /// Get all sizes from database

  Future<List<AdSize>> getSizes() async {
    final elements = await _db.getAll(_tableSizes);

    return elements.map(AdSize.fromJson).toList();
  }

  /// Register Client

  Future<OpStatus> registerEmployee(JsonMap data) async {
    final file= <String,dynamic>{
      'files':data['files'],
    };
    final response = await _net.upload(

      'self/registration',
      files: file,
      data,
    );
    print(file);

    return OpStatus.fromResponse(response);
  }

  /// Register Merchant

  Future<OpStatus> registerMerchant(JsonMap data) async {
    final response =
        await _net.post('api/User/create/merchant_maintenance', data);

    return OpStatus.fromResponse(response);
  }

  /// Function to log in the user, returns a token for verification

  Future<OpStatus> login(JsonMap body) async {
    try {
      final response = await _net.post('log-in', body);

      if (response.isSuccessful()) {
        final data = response.data;

        final userData = await _db.insertOne(
          _tableUsers,
          User.toMap(data as JsonMap),
        );

        final oldUserId = await _prefs.getInt(_keyUserId);

        await _prefs.set(
          _keyUserChanged,
          oldUserId.toString() != userData['userId'].toString(),
        );

        await _prefs.set(_keyUserId, userData['userId']);

        await _prefs.set(_keyLoggedIn, true);

        await _prefs.set(
          _keyToken,
          (response.data as JsonMap)['token'],
        );

        _controller.add(AuthStatus.authenticated);
      }

      return OpStatus.fromResponse(response);
    } catch (e) {
      return OpStatus.error(e.toString());
    }
  }

  /// Returns the logged in [User] object or null.

  Future<User?> getUser() async {
    final id = await _prefs.getInt(_keyUserId);

    if (id == null) return null;

    final userData = await _db.getOne(_tableUsers, id);

    if (userData == null) return null;

    return User.fromJson(userData);
  }

  //// Returns the bio of a logged in user

  Future<Bio?> getBio() async {
    final id = await _prefs.getInt(_keyBioId);

    if (id == null) return null;

    final bioData = await _db.getOne(_tableBio, id);

    if (bioData == null) return null;

    return Bio.fromJson(bioData);
  }

  /// Returns the role of a loggedin user

  Future<Role?> getRole() async {
    final id = await _prefs.getInt(_keyRoleId);

    if (id == null) return null;

    final roleData = await _db.getOne(_tableRole, id);

    if (roleData == null) return null;

    return Role.fromJson(roleData);
  }

  /// Function to log out the user

  Future<void> logOut() async {
    _controller.add(AuthStatus.unauthenticated);

    await _prefs.deleteValue(_keyUserId);

    await _prefs.deleteValue(_keyLoggedIn);

    await _prefs.deleteValue(_keyToken);
  }

  /// get otp verifivation

  Future<OpStatus> fertchOpt(JsonMap data) async {
    final response = await _net.post(
      'User/send/loan/otp',
      data,
    );

    return OpStatus.fromResponse(response);
  }

  /// get total from db

  Future<List<Total>> getTottals() async {
    final boards = await _db.getAll(_tableTotal);

    return boards.map(Total.fromJson).toList();
  }

  /// RejectBoard

  Future<OpStatus> rejectBoard(int id, String reason) async {
    final response = await _net.get(
      'Reject/Billboards?id=$id&reason=$reason',
    );

    return OpStatus.fromResponse(response);
  }

  /// Activate Board

  Future<OpStatus> activateBoard(int id) async {
    final response = await _net.get('Approve/Billboards?id=$id');

    return OpStatus.fromResponse(response);
  }

  /// fertch banks
  Future<OpStatus> ferctchBanks() async {
    final response = await _net.get('get/banks/list');

    if (response.isSuccessful()) {
      final list = response.data as List;

      final data = list.map((e) => Bank.toMap(e as JsonMap)).toList();

      return OpStatus(message: response.message, success: true, data: data);
    }

    return OpStatus.fromResponse(response);
  }

  /// fetch loans

  Future<OpStatus> fertchloans() async {
    final response = await _net.get('get/loans/list?');

    if (response.isSuccessful()) {
      final list = response.data as List;

      final data = list.map((e) => Loan.toMap(e as JsonMap)).toList();

      return OpStatus(message: response.message, success: true, data: data);
    }

    return OpStatus.fromResponse(response);
  }

  Future<OpStatus> fertchProduct() async {
    final response = await _net.get('user/get/products');
    final responseData = response.data as List;
    final data = responseData.map((e) => Product.toMap(e as JsonMap)).toList();

    await _db.insertAll(_tableProducts, data);
    return OpStatus.fromResponse(response);
  }

  Future<OpStatus> applyLoan(JsonMap data) async {
    final response = await _net.post('User/initiate/loan/application', data);

    return OpStatus.fromResponse(response);
  }

  /// make payment

  Future<OpStatus> maakePayment(JsonMap body) async {
    final response = await _net.post('User/make/payment', body);

    return OpStatus.fromResponse(response);
  }

  /// Get all products from database

  Future<List<Product>> getProducts() async {
    final elements = await _db.getAll(_tableProducts);

    return elements.map(Product.fromJson).toList();
  }

  /// Make Payment
  Future<OpStatus> makePayment(JsonMap body) async {
    final response = await _net.post('User/make/payment', body);
    return OpStatus.fromResponse(response);
  }

  /// fertch Balance
  Future<OpStatus> fertchBalance() async {
    final id = await _prefs.getInt(_keyUserId);
    final response =
        await _net.get('Employee/Get/Current/balance?employee_id=$id');

    if (response.isSuccessful()) {
      final responseData = response.data as List;
      final data =
          responseData.map((e) => Balance.toMap(e as JsonMap)).toList();

      await _db.insertAll(_tableBalance, data);
    }
    return OpStatus.fromResponse(response);
  }

  /// fertch merchant by code
  Future<OpStatus> fertchMercntByCode(String code) async {
    final response =
        await _net.get('View/Merchants/By-Code?merchant_code=$code');
    if (response.isSuccessful()) {
      final reponsedata = response.data;
      final merchantData = <JsonMap>[];
      for (final map in reponsedata as List<dynamic>) {
        final data = <String, dynamic>{
          'status': (map as JsonMap)['status'],
          'approval_trail': map['approval_trail'],
          'authLevel': map['authLevel'],
          'bankId': map['bankId'],
          'businessName': map['businessName'],
          'businessNature': map['businessNature'],
          'companyAccountNumber': map['companyAccountNumber'],
          'companyName': map['companyName'],
          'companyPhone': map['companyPhone'],
          'companyRegistrationDate': map['companyRegistrationDate'],
          'contactEmail': map['contactEmail'],
          'createdByUserId': map['createdByUserId'],
          'createdByUserRoleId': map['createdByUserRoleId'],
          'merchantType': map['createdByUserRoleId'],
          'merchant_number': map['merchant_number'],
          'qr_code_name': map['qr_code_name'],
          'qr_code_path': map['qr_code_path'],
          'registrationNumber': map['registrationNumber'],
          'taxno': map['taxno'],
          'user_id': map['user_id'],
          'merchant_name': map['merchant_name'],
        };
        merchantData.add(data);
      }
      return OpStatus(
          message: response.message, success: true, data: merchantData);
    }

    return OpStatus.fromResponse(response);
  }

  /// fertch Transactions
  Future<OpStatus> fertchTransactions() async {
    final id = await _prefs.getInt(_keyUserId);
    final response = await _net.get('User/get/transactions/list?user_id=$id');
    if (response.isSuccessful()) {
      final responseData = response.data as List;
      final data =
          responseData.map((e) => Transaction.toMap(e as JsonMap)).toList();
      await _db.insertAll(_tableTrans, data);
    }
    return OpStatus.fromResponse(response);
  }

  /// Get Transactions from db
  Future<List<Transaction>> getTrans() async {
    final elements = await _db.getAll(_tableTrans);

    return elements.map(Transaction.fromJson).toList();
  }

  /// Get Balances
  Future<List<Balance>> getBalance() async {
    final element = await _db.getAll(_tableBalance);

    return element.map(Balance.fromJson).toList();
  }

  /// Close the controller

  void dispose() {
    _controller.close();

    _progressController.close();

    _progressSub.cancel();
  }

  ////
  List<Places> fertchplaces() {
    final co = <JsonMap>[
      {
        'image':
            'https://images.unsplash.com/photo-1485965120184-e220f721d03e?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmlrZXxlbnwwfHwwfHx8MA%3D%3D',
        'latitude': -15.40913,
        'longitude': 28.32164,
        'street': 'solwezi street',
        'type': 'school',
        'name': 'solowezi Basic',
      },
      {
        'image':
            'https://media.istockphoto.com/id/1344641306/photo/professional-gravel-bike-or-road-bike-isolated-on-white-background.webp?b=1&s=170667a&w=0&k=20&c=0_nTgr6oYeZk7jAkx4xD5FOVMqoRzgkm_YYE3HHBJuw=',
        'latitude': -15.41407929850562,
        'longitude': 28.28619003953091,
        'street': 'Solwezi',
        'type': 'Market',
        'name': 'Market..',
      },
      {
        'image':
            'https://media.istockphoto.com/id/958687296/photo/vintage-blue-city-bicycle-against-a-black-wall.webp?s=170667a&w=0&k=20&c=jrKTrCm7A5INJqsCWFReMlTgPRQLRSgSm9Q22zI1hWw=',
        'latitude': -15.414812162672844,
        'longitude': 28.3053177921208,
        'street': 'solwezi',
        'type': 'Lodget',
        'name': 'Mutanda Falls',
      },
      {
        'image':
            'https://images.unsplash.com/photo-1485965120184-e220f721d03e?dpr=2&h=294&w=294&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXRodW1ibmFpbHx8MjMzMjA0OTR8fGVufDB8fHx8fA%3D%3D',
        'latitude': -15.423168873016412,
        'longitude': 28.302699318150975,
        'street': 'katondo',
        'type': 'Bank',
        'name': 'Stanbic',
      },
      {
        'image':
            'https://www.hindustantimes.com/ht-img/img/2024/01/19/550x309/bicycle_1705663087655_1705663087985.jpg',
        'latitude': -15.42362405148482,
        'longitude': 28.195571660974185,
        'street': 'KOnzani ',
        'type': 'Bank',
        'name': 'Stanbic',
      },
    ];

    //  return boards.map(Province.fromJson).toList();
    return co.map(Places.fromJson).toList();
  }
}
