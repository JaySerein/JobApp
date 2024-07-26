class SuccessConnectModel {
  String id;
  String jobID;
  String jobName;
  String pUserID;
  String pUserName;
  String pUserImage;
  String pProfileID;
  String eUserID;
  String eUserName;
  String eUserImage;
  String eEnterpriseID;
  String date;

  SuccessConnectModel({
    this.id = '',
    this.jobID = '',
    this.jobName = '',
    this.pUserID = '',
    this.pUserName = '',
    this.pUserImage = '',
    this.pProfileID = '',
    this.eUserID = '',
    this.eUserName = '',
    this.eUserImage = '',
    this.eEnterpriseID = '',
    this.date = '',
  });

  factory SuccessConnectModel.formJson(Map<String, dynamic> json) {
    return SuccessConnectModel(
      id: json['_id'],
      jobID: json['Job']['JobID'],
      jobName: json['Job']['JobName'],
      pUserID: json['Personal']['UserID'],
      pUserName: json['Personal']['UserName'],
      pUserImage: json['Personal']['UserImage']['imageUrl'],
      pProfileID: json['Personal']['ProfileID'],
      eUserID: json['Enterprise']['UserID'],
      eUserName: json['Enterprise']['UserName'],
      eUserImage: json['Enterprise']['UserImage']['imageUrl'],
      eEnterpriseID: json['Enterprise']['EnterpriseID'],
      date: json['Date'],
    );
  }
}
