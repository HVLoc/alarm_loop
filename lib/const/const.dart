class AppConst {
  // --------- EasyInvoiceMobile ----------
  // static const String urlBase = 'http://mobileapi.easyinvoice.com.vn/api';

  static const String urlBase = 'http://2301082948097.softdreams.vn/api';

  // static const String urlBase = 'http://192.168.1.38:45455/api';

  static const String urlLogin = urlBase + '/account/verify';

  static const String urlProductSearch = urlBase + '/product/search';
  static const String urlCustomerSearch = urlBase + '/customer/search';
  static const String urlInvoiceDetail = urlBase + '/invoice/getdetail';

  //invoice creation
  static const String urlPublishImportInvoice =
      urlBase + '/publish/importInvoice';
  static const String urlPublishImportAndIssueInvoice =
      urlBase + '/publish/importAndIssueInvoice”.';

  //app
  static const String appName = "EasyInvoice";
  static const String appStoreId = "1528666381";
  static const String aboutUsUrl = "https://easyinvoice.vn/";

  //base
  static const int pageSize = 10;
  static const int defaultPage = 1;
  static const int requestTimeOut = 15000; //ms

  static const int millisecondsDefault = 1000;
  static const int limitPhone = 10;
  static const int responseSuccess = 2;
  static const int codeSuccess = 200;

  //login
  static const int codeBlocked = 400;
  static const int codeAccountNotExist = 401;
  static const int codePasswordNotCorrect = 402;

// sharedPref
  static const String keyUserId = 'key_user_id';
  static const String keyUserName = 'key_user_name';
  static const String keyPassword = 'key_password';
  static const String keyComName = 'key_com_name';
  static const String keyTokenDevice = "key_token_device";
  static const String keyTokenAcount = "key_token_account";
  static const String keyTheme = 'key_theme';
  static const String keyPattern = 'key_pattern';
  static const String keySerial = 'key_serial';
  static const String keyStatus = 'key_status';
  static const String keyTime = 'key_time';
  static const String keyFromDate = 'key_from_date';
  static const String keyToDate = 'key_to_date';
  static const String keyPathInvoice = 'key_path_invoice';

// routes enum: các đường dẫn chuyển màn trong app
  static const String routeHome = '/home';
  static const String routeLogin = '/login';

  static const String routePdf = '/pdf';
  static const String routeProfile = '/profile';
  static const String routeProduct = '/product';
  static const String routeInvoice = '/invoice';
  static const String routeCustomer = '/customer';
  static const String routeInvoiceCreation = '/invoiceCreation';
  static const String routeProductDetail = '/productDetail';
  static const String routeCustomerDetail = '/customerDetail';
  static const String routeInvoiceDetail = '/invoiceDetail';

  //error
  static const int error500 = 500;
  static const int error404 = 404;
  static const int error401 = 401;
  static const int error400 = 400;
  static const int error502 = 502;
  static const int error503 = 503;

  //forgot password
  static const int countdownOtp = 5;
  static const int numOtp = 6;

  static const String vnd = "VNĐ";
  static const String millionSort = 'tr';
  static const String billion = 'tỷ';
  static const String moneySpaceStr = ",";
  static const int moneySpacePos = 3;
}

enum CheckValidation { PHONE, PASSWORD }
