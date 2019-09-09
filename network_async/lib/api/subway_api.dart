const String _urlPrefix = 'http://swopenapi.seoul.go.kr/api/subway/';
const String _userKey = 'sample';
const String _urlSuffix = '/json/realtimeStationArrival/0/5/';
const String defaultStation = '광화문';

String buildUrl(String station) {
  StringBuffer sb = StringBuffer();
  sb.write(_urlPrefix);
  sb.write(_userKey);
  sb.write(_urlSuffix);
  sb.write(station);
  return sb.toString();
}