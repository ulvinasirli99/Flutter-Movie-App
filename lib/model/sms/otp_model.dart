class OtpModel {
  String? messageCount;
  List<Messages> ?messages;

  OtpModel({this.messageCount, this.messages});

  OtpModel.fromJson(Map<String, dynamic> json) {
    messageCount = json['message-count'];
    if (json['messages'] != null) {
      messages = new List<Messages>.empty(growable: true);
      json['messages'].forEach((v) {
        messages?.add(new Messages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message-count'] = this.messageCount;
    if (this.messages != null) {
      data['messages'] = this.messages?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Messages {
  String?to;
  String?messageId;
  String?status;
  String?remainingBalance;
  String?messagePrice;
  String?network;

  Messages(
      {this.to,
      this.messageId,
      this.status,
      this.remainingBalance,
      this.messagePrice,
      this.network});

  Messages.fromJson(Map<String, dynamic> json) {
    to = json['to'];
    messageId = json['message-id'];
    status = json['status'];
    remainingBalance = json['remaining-balance'];
    messagePrice = json['message-price'];
    network = json['network'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['to'] = this.to;
    data['message-id'] = this.messageId;
    data['status'] = this.status;
    data['remaining-balance'] = this.remainingBalance;
    data['message-price'] = this.messagePrice;
    data['network'] = this.network;
    return data;
  }
}
