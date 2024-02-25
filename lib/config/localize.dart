import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizeExt on String {
  String localize(BuildContext context) {
    String text = this;
    switch (text) {
      case 'liveBroadcast':
        return AppLocalizations.of(context)!.liveBroadcast;
      case 'latestNews':
        return AppLocalizations.of(context)!.latestNews;
      case 'news':
        return AppLocalizations.of(context)!.news;
      case 'instant':
        return AppLocalizations.of(context)!.instant;
      case 'readMore':
        return AppLocalizations.of(context)!.readMore;
      case 'newsList':
        return AppLocalizations.of(context)!.newsList;
      case 'todayMention':
        return AppLocalizations.of(context)!.todayMention;
      case 'about':
        return AppLocalizations.of(context)!.about;
      case 'result':
        return AppLocalizations.of(context)!.result;
      case 'home':
        return AppLocalizations.of(context)!.home;
      case 'topics':
        return AppLocalizations.of(context)!.topics;
      case 'search':
        return AppLocalizations.of(context)!.search;
      case 'subscribe':
        return AppLocalizations.of(context)!.subscribe;
      case 'works':
        return AppLocalizations.of(context)!.works;
      case 'noInternetConnection':
        return AppLocalizations.of(context)!.noInternetConnection;
      case 'tryagain':
        return AppLocalizations.of(context)!.tryagain;
      case 'photo':
        return AppLocalizations.of(context)!.photo;
      case 'video':
        return AppLocalizations.of(context)!.video;
      case 'youtube':
        return AppLocalizations.of(context)!.youtube;
      case 'audio':
        return AppLocalizations.of(context)!.audio;
      case 'document':
        return AppLocalizations.of(context)!.document;
      case 'similarNews':
        return AppLocalizations.of(context)!.similarNews;
      case 'internetError':
        return AppLocalizations.of(context)!.internetError;
      case 'previousMonth':
        return AppLocalizations.of(context)!.previousMonth;
      case 'nextMonth':
        return AppLocalizations.of(context)!.nextMonth;
      case 'najaf':
        return AppLocalizations.of(context)!.najaf;
      case 'london':
        return AppLocalizations.of(context)!.london;
      case 'wednesdayBusiness':
        return AppLocalizations.of(context)!.wednesdayBusiness;
      case 'welcome':
        return AppLocalizations.of(context)!.welcome;
      case 'personalAccount':
        return AppLocalizations.of(context)!.personalAccount;
      case 'createProfile':
        return AppLocalizations.of(context)!.createProfile;
      case 'login':
        return AppLocalizations.of(context)!.login;
      case 'favorite':
        return AppLocalizations.of(context)!.favorite;
      case 'programs':
        return AppLocalizations.of(context)!.programs;
      case 'preyers':
        return AppLocalizations.of(context)!.preyers;
      case 'aboutUs':
        return AppLocalizations.of(context)!.aboutUs;
      case 'live':
        return AppLocalizations.of(context)!.live;
      case 'editProfile':
        return AppLocalizations.of(context)!.editProfile;
      case 'reset':
        return AppLocalizations.of(context)!.reset;
      case 'save':
        return AppLocalizations.of(context)!.save;
      case 'sentenceOne':
        return AppLocalizations.of(context)!.sentenceOne;
      case 'sentenceTwo':
        return AppLocalizations.of(context)!.sentenceTwo;
      case 'register':
        return AppLocalizations.of(context)!.register;
      case 'firstname':
        return AppLocalizations.of(context)!.firstname;
      case 'lastname':
        return AppLocalizations.of(context)!.lastname;
      case 'email':
        return AppLocalizations.of(context)!.email;
      case 'password':
        return AppLocalizations.of(context)!.password;
      case 'nextPhase':
        return AppLocalizations.of(context)!.nextPhase;
      case 'enterName':
        return AppLocalizations.of(context)!.enterName;
      case 'enterEmail':
        return AppLocalizations.of(context)!.enterEmail;
      case 'enterPassword':
        return AppLocalizations.of(context)!.enterPassword;
      case 'emailInCorrect':
        return AppLocalizations.of(context)!.emailInCorrect;
      case 'passwordInCorrect':
        return AppLocalizations.of(context)!.passwordInCorrect;
      case 'enterCode':
        return AppLocalizations.of(context)!.enterCode;
      case 'resendCode':
        return AppLocalizations.of(context)!.resendCode;
      case 'second':
        return AppLocalizations.of(context)!.second;
      case 'programList':
        return AppLocalizations.of(context)!.programList;
      case 'language':
        return AppLocalizations.of(context)!.language;
      case 'setting':
        return AppLocalizations.of(context)!.setting;
      case 'exit':
        return AppLocalizations.of(context)!.exit;
      case 'nothingCalenderToShow':
        return AppLocalizations.of(context)!.nothingCalenderToShow;
      case 'unauthenticated':
        return AppLocalizations.of(context)!.unauthenticated;
      case 'bio':
        return AppLocalizations.of(context)!.bio;
      case 'submit':
        return AppLocalizations.of(context)!.submit;
      case 'sentenceThree':
        return AppLocalizations.of(context)!.sentenceThree;
      case 'sentenceFour':
        return AppLocalizations.of(context)!.sentenceFour;
      case 'successProfile':
        return AppLocalizations.of(context)!.successProfile;
      case 'logout':
        return AppLocalizations.of(context)!.logout;
      case 'logoutSuccess':
        return AppLocalizations.of(context)!.logoutSuccess;
      case 'logoutMessage':
        return AppLocalizations.of(context)!.logoutMessage;
      case 'remove':
        return AppLocalizations.of(context)!.remove;
      case 'noContent':
        return AppLocalizations.of(context)!.noContent;
      case 'changeInfo':
        return AppLocalizations.of(context)!.changeInfo;
      case 'otherNews':
        return AppLocalizations.of(context)!.otherNews;
      case 'camera':
        return AppLocalizations.of(context)!.camera;
      case 'gallery':
        return AppLocalizations.of(context)!.gallery;
      case 'removePhoto':
        return AppLocalizations.of(context)!.removePhoto;
      case 'sizePhoto':
        return AppLocalizations.of(context)!.sizePhoto;
      case 'openSite':
        return AppLocalizations.of(context)!.openSite;
      case 'privacyPolicy':
        return AppLocalizations.of(context)!.privacyPolicy;
      case 'yes':
        return AppLocalizations.of(context)!.yes;
      case 'cancel':
        return AppLocalizations.of(context)!.cancel;
      case 'serverError':
        return AppLocalizations.of(context)!.serverError;
      default:
        return '';
    }
  }
}
