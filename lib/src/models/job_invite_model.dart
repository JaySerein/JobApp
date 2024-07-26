class JobInviteModel {
  String id;
  String jobID;
  String jobName;
  String fUserID;
  String fUserName;
  String fUserImage;
  String fEnterpriseID;
  String tUserID;
  String tUserName;
  String tUserImage;
  String tProfileID;
  String date;
  String status;

  JobInviteModel({
    this.id = '',
    this.jobID = '',
    this.jobName = '',
    this.fUserID = '',
    this.fUserName = '',
    this.fUserImage = '',
    this.tProfileID = '',
    this.tUserID = '',
    this.tUserName = '',
    this.tUserImage = '',
    this.fEnterpriseID = '',
    this.date = '',
    this.status = '',
  });

  factory JobInviteModel.formJson(Map<String, dynamic> json) {
    return JobInviteModel(
      id: json['_id'],
      jobID: json['Job']['JobID'],
      jobName: json['Job']['JobName'],
      fUserID: json['InviteFrom']['UserID'],
      fUserName: json['InviteFrom']['UserName'],
      fUserImage: json['InviteFrom']['UserImage']['imageUrl'],
      fEnterpriseID: json['InviteFrom']['EnterpriseID'],
      tUserID: json['InviteTo']['UserID'],
      tUserName: json['InviteTo']['UserName'],
      tUserImage: json['InviteTo']['UserImage']['imageUrl'],
      tProfileID: json['InviteTo']['ProfileID'],
      date: json['Date'],
      status: json['Status'],
    );
  }
}
