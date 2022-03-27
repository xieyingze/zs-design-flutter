class CommonApiModel {
  String? appHost;
  String? appStyle;
  String? statAppUrl;
  String? eventStatUrl;
  String? loginUrl;
  String? appleLoginUrl;
  String? logoutUrl;
  String? wechatLoginUrl;
  String? editUserInfoUrl;
  String? homeSearchListUrl;
  String? verificationCodeUrl;
  String? subBlockListUrl;
  String? userSubListUrl;
  String? delUserSubUrl;
  String? addUserSubUrl;
  String? blockItemListUrl;
  String? articleDetailUrl;
  String? searchBridgingUrl;
  String? privacyPolicyUrl;
  String? userAgreementUrl;
  String? permissionProtocolUrl;
  String? boxProtocolUrl;
  String? favBridgingUrl;
  String? historyBridgingUrl;
  String? favListUrl;
  String? historyListUrl;
  String? androidUpdateUrl;
  String? releaseCommentUrl;
  String? userCollectionDelUrl;
  String? userHistoryDelUrl;
  String? weiboLoginUrl;
  String? temporaryTokenUrl;
  String? addmediaUrl;
  String? discussionAddpostUrl;
  String? officialReplyListUrl;
  String? submitFeedbackUrl;
  String? informationSubmitUrl;
  String? informationListUrl;
  String? informationAddMediaUrl;
  String? articleExtInfoUrl;

  CommonApiModel(
      {this.appHost,
      this.appStyle,
      this.statAppUrl,
      this.eventStatUrl,
      this.loginUrl,
      this.appleLoginUrl,
      this.logoutUrl,
      this.wechatLoginUrl,
      this.editUserInfoUrl,
      this.homeSearchListUrl,
      this.verificationCodeUrl,
      this.subBlockListUrl,
      this.userSubListUrl,
      this.delUserSubUrl,
      this.addUserSubUrl,
      this.blockItemListUrl,
      this.articleDetailUrl,
      this.searchBridgingUrl,
      this.privacyPolicyUrl,
      this.userAgreementUrl,
      this.permissionProtocolUrl,
      this.boxProtocolUrl,
      this.favBridgingUrl,
      this.historyBridgingUrl,
      this.favListUrl,
      this.historyListUrl,
      this.androidUpdateUrl,
      this.releaseCommentUrl,
      this.userCollectionDelUrl,
      this.userHistoryDelUrl,
      this.weiboLoginUrl,
      this.temporaryTokenUrl,
      this.addmediaUrl,
      this.discussionAddpostUrl,
      this.officialReplyListUrl,
      this.submitFeedbackUrl,
      this.informationSubmitUrl,
      this.informationListUrl,
      this.informationAddMediaUrl,
      this.articleExtInfoUrl});

  CommonApiModel.fromJson(Map<String, dynamic> json) {
    articleExtInfoUrl = json['article_ext_info_url'];
    appHost = json['app_host'];
    appStyle = json['app_style'];
    statAppUrl = json['stat_app_url'];
    eventStatUrl = json['event_stat_url'];
    loginUrl = json['login_url'];
    appleLoginUrl = json['apple_login_url'];
    logoutUrl = json['logout_url'];
    wechatLoginUrl = json['wechat_login_url'];
    editUserInfoUrl = json['edit_user_info_url'];
    homeSearchListUrl = json['home_search_list_url'];
    verificationCodeUrl = json['verification_code_url'];
    subBlockListUrl = json['sub_block_list_url'];
    userSubListUrl = json['user_sub_list_url'];
    delUserSubUrl = json['del_user_sub_url'];
    addUserSubUrl = json['add_user_sub_url'];
    blockItemListUrl = json['block_item_list_url'];
    articleDetailUrl = json['article_detail_url'];
    searchBridgingUrl = json['search_bridging_url'];
    privacyPolicyUrl = json['privacy_policy_url'];
    userAgreementUrl = json['user_agreement_url'];
    permissionProtocolUrl = json['permission_protocol_url'];
    boxProtocolUrl = json['box_protocol_url'];
    favBridgingUrl = json['fav_bridging_url'];
    historyBridgingUrl = json['history_bridging_url'];
    favListUrl = json['fav_list_url'];
    historyListUrl = json['history_list_url'];
    androidUpdateUrl = json['android_update_url'];
    releaseCommentUrl = json['release_comment_url'];
    userCollectionDelUrl = json['user_collection_del_url'];
    userHistoryDelUrl = json['user_history_del_url'];
    weiboLoginUrl = json['weibo_login_url'];
    temporaryTokenUrl = json['temporary_token_url'];
    addmediaUrl = json['addmedia_url'];
    discussionAddpostUrl = json['discussion_addpost_url'];
    officialReplyListUrl = json['official_reply_list_url'];
    submitFeedbackUrl = json['submit_feedback_url'];
    informationSubmitUrl = json['information_submit_url'];
    informationListUrl = json['information_list_url'];
    informationAddMediaUrl = json['information_add_media_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['app_host'] = this.appHost;
    data['app_style'] = this.appStyle;
    data['stat_app_url'] = this.statAppUrl;
    data['event_stat_url'] = this.eventStatUrl;
    data['login_url'] = this.loginUrl;
    data['apple_login_url'] = this.appleLoginUrl;
    data['logout_url'] = this.logoutUrl;
    data['wechat_login_url'] = this.wechatLoginUrl;
    data['edit_user_info_url'] = this.editUserInfoUrl;
    data['home_search_list_url'] = this.homeSearchListUrl;
    data['verification_code_url'] = this.verificationCodeUrl;
    data['sub_block_list_url'] = this.subBlockListUrl;
    data['user_sub_list_url'] = this.userSubListUrl;
    data['del_user_sub_url'] = this.delUserSubUrl;
    data['add_user_sub_url'] = this.addUserSubUrl;
    data['block_item_list_url'] = this.blockItemListUrl;
    data['article_detail_url'] = this.articleDetailUrl;
    data['search_bridging_url'] = this.searchBridgingUrl;
    data['privacy_policy_url'] = this.privacyPolicyUrl;
    data['user_agreement_url'] = this.userAgreementUrl;
    data['permission_protocol_url'] = this.permissionProtocolUrl;
    data['box_protocol_url'] = this.boxProtocolUrl;
    data['fav_bridging_url'] = this.favBridgingUrl;
    data['history_bridging_url'] = this.historyBridgingUrl;
    data['fav_list_url'] = this.favListUrl;
    data['history_list_url'] = this.historyListUrl;
    data['android_update_url'] = this.androidUpdateUrl;
    data['release_comment_url'] = this.releaseCommentUrl;
    data['user_collection_del_url'] = this.userCollectionDelUrl;
    data['user_history_del_url'] = this.userHistoryDelUrl;
    data['weibo_login_url'] = this.weiboLoginUrl;
    data['temporary_token_url'] = this.temporaryTokenUrl;
    data['addmedia_url'] = this.addmediaUrl;
    data['discussion_addpost_url'] = this.discussionAddpostUrl;
    data['official_reply_list_url'] = this.officialReplyListUrl;
    data['submit_feedback_url'] = this.submitFeedbackUrl;
    data['information_submit_url'] = this.informationSubmitUrl;
    data['information_list_url'] = this.informationListUrl;
    data['information_add_media_url'] = this.informationAddMediaUrl;
    return data;
  }
}
