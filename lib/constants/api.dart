class Api {
  Api._();

  //base url
  static const String baseUrl = 'https://amirrezagu.liara.run';
  static const String baseUrlSite = 'https://alghamar-vercel.vercel.app';
  static const int perPage = 10;

  //auth
  static const String login = '/api/collections/user/auth-with-password';
  static const String register = '/api/collections/user/records';

  //user
  static const String user = '/api/collections/user/records/';

  //category
  static const String category = '/api/collections/category/records';

  //articles
  static const String articles = '/api/collections/article/records';
  static const String forceArticles = '/api/collections/forceArticle/records';

  //calender
  static const String calender = '/api/collections/calender/records';

  //live
  static const String live = '/api/collections/live/records';
  static const String program = '/api/collections/programTime/records';

  //azan
  static const String azan = 'https://api.aladhan.com/v1/timingsByCity';
}
