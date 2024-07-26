class JAPI {
  static const url = "https://jayserein.xyz";
  // static const url = "http://192.168.1.152:3000";
  static const urlRegister = '/api/auth/register';
  static const urlLogin = '/api/auth/login';
  static const urlRefreshToken = '/api/token/access_token';
  static const urlRole = '/api/user/set_role';
  static const urlDistrict = '/api/profile/get-district';
  static const urlProvince = '/api/profile/get-province';
  static const urlSkills = '/api/profile/get-skills';
  static const urlCategory = '/api/profile/get-category';

  static const urlUpdateInfo = '/api/user/update-info';

  static const urlUpdateProfile = '/api/profile/update-personal-profile';
  static const urlGetProfile = '/api/profile/get-personal-profile';
  static const urlGetProfileWithID = '/api/profile/get-personal-profileid';
  static const urlGetListProfile = '/api/profile/get-list-profile';

  static const urlGetEnterpriseProfile =
      '/api/enterprise/get-enterprise-profile';
  static const urlUpdateEnterpriseProfile =
      '/api/enterprise/update-enterprise-profile';
  static const urlCreateJob = '/api/enterprise/job-create';
  static const urlGetEnterpriseJob = '/api/enterprise/get-job';
  static const urlGetJob = '/api/enterprise/get-suggest-job';

  static const urlApply = '/api/job/apply-job';
  static const urlEnterpriseListApply = '/api/job/list-apply';
  static const urlAcceptApply = '/api/job/accept-apply';
  static const urlDenyApply = '/api/job/deny-apply';

  static const urlListInteview = '/api/job/list-interview';
  static const urlGetInterviewDetails = '/api/job/get-interview-details';
  static const urlCreateInterview = '/api/job/create-interview';

  static const urlChangeAvatar = '/api/user/update-avatar';

  static const urlInvite = '/api/job/invite-job';
  static const urlPersonalListInvite = '/api/job/list-invite';
  static const urlAcceptInvite = '/api/job/accept-invite';
  static const urlDenyInvite = '/api/job/deny-invite';

  static const urlPersonalInterview = '/api/job/user-interview';
  static const urlPInterviewDetails = '/api/job/user-interview-details';

  static const urlGetJobID = '/api/enterprise/get-job-id';
}
