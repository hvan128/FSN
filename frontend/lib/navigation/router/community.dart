import 'package:flutter/material.dart';
import 'package:frontend/screens/community/add_dish_screen.dart';
import 'package:frontend/screens/community/add_feedback_screen.dart';
import 'package:frontend/screens/community/community_screen.dart';
import 'package:frontend/screens/community/dish_detail_screen.dart';
import 'package:frontend/screens/community/feedback_detail_screen.dart';
import 'package:frontend/screens/community/feedback_screen.dart';
import 'package:frontend/screens/community/search_dish_screen.dart';

class RouterCommunity {
  static const String community = '/community';
  static const String addDish = '/add-dish';
  static const String dishDetail = '/dish-detail';
  static const String feedback = '/feedback';
  static const String addFeedback = '/add-feedback';
  static const String feedbackDetail = '/feedback-detail';
  static const String searchDish = '/search-dish';
}

Map<String, WidgetBuilder> communityRoutes = {
  RouterCommunity.community: (context) => const CommunityScreen(),
  RouterCommunity.addDish: (context) => const AddDishScreen(),
  RouterCommunity.dishDetail: (context) => const DishDetailScreen(),
  RouterCommunity.addFeedback: (context) => const AddFeedbackScreen(),
  RouterCommunity.feedback: (context) => const FeedbackScreen(),
  RouterCommunity.feedbackDetail: (context) => const FeedbackDetailScreen(),
  RouterCommunity.searchDish: (context) => const SearchDishScreen(),
};