class Quote {
  String quote;
  int error;

  Quote({this.quote, this.error});

  Quote.fromJson(Map<String, dynamic> json) {
    quote = json['quote'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quote'] = this.quote;
    data['error'] = this.error;
    return data;
  }
}
