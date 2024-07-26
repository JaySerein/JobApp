class JobApplyModel {
  String id;
  String jobID;
  String jobName;
  String fUserID;
  String fUserName;
  String fUserImage;
  String fProfileID;
  String tUserID;
  String tUserName;
  String tUserImage;
  String tEnterpriseID;
  String date;
  String status;

  JobApplyModel({
    this.id = '',
    this.jobID = '',
    this.jobName = '',
    this.fUserID = '',
    this.fUserName = '',
    this.fUserImage = '',
    this.fProfileID = '',
    this.tUserID = '',
    this.tUserName = '',
    this.tUserImage = '',
    this.tEnterpriseID = '',
    this.date = '',
    this.status = '',
  });

  factory JobApplyModel.formJson(Map<String, dynamic> json) {
    return JobApplyModel(
      id: json['_id'],
      jobID: json['Job']['JobID'],
      jobName: json['Job']['JobName'],
      fUserID: json['ApplyFrom']['UserID'],
      fUserName: json['ApplyFrom']['UserName'],
      fUserImage: json['ApplyFrom']['UserImage']['imageUrl'],
      fProfileID: json['ApplyFrom']['ProfileID'],
      tUserID: json['ApplyTo']['UserID'],
      tUserName: json['ApplyTo']['UserName'],
      tUserImage: json['ApplyTo']['UserImage']['imageUrl'],
      tEnterpriseID: json['ApplyTo']['EnterpriseID'],
      date: json['Date'],
      status: json['Status'],
    );
  }
}
