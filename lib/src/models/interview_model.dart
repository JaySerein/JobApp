class InterviewModel {
  String id;
  String jobSuccessID;
  String date;
  String time;
  String place;
  String room;
  String interviewer;
  String skin;
  String doc;
  String requirement;
  InterviewModel(
      {this.id = '',
      this.jobSuccessID = '',
      this.date = '',
      this.time = '',
      this.place = '',
      this.room = '',
      this.interviewer = '',
      this.skin = '',
      this.doc = '',
      this.requirement = ''});
  factory InterviewModel.formJson(Map<String, dynamic> json) {
    return InterviewModel(
        id: json['_id'],
        jobSuccessID: json['jobSuccessID'],
        date: json['date'],
        time: json['time'],
        place: json['place'],
        room: json['room'],
        interviewer: json['interviewer'],
        skin: json['skin'],
        doc: json['doc'],
        requirement: json['requirement']);
  }
}
