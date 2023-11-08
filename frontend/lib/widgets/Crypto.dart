// ignore_for_file: file_names

class Crypto {
  int? id;
  // String? icon;
  String? symbol;
  String? name;
  double? price;
  double? changeIn24h;

  Crypto(
      {this.id,
      // this.icon,
      this.symbol,
      this.name,
      this.price,
      this.changeIn24h});

  Crypto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // icon = json['icon'];
    symbol = json['symbol'];
    name = json['name'];
    price = roundNumber(json['quote']['USD']['price']);
    changeIn24h = roundNumber(json['quote']['USD']['percent_change_24h']);
  }

  double roundNumber(double number) {
    var numberToStringArr = number.toString().split(".");
    numberToStringArr[1] = numberToStringArr[1].substring(0, 2);
    double result = double.parse(numberToStringArr.join('.'));
    return result;
  }
}
