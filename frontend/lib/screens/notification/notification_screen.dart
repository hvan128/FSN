import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/components/modals/modal_classify.dart';
import 'package:frontend/components/modals/modal_filter.dart';
import 'package:frontend/models/category/category.dart';
import 'package:frontend/models/community/dish.dart';
import 'package:frontend/models/notification/announcement_model.dart';
import 'package:frontend/models/user/user.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/navigation/router/community.dart';
import 'package:frontend/provider/category.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/services/category/category_service.dart';
import 'package:frontend/services/notification/local_notification.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/utils/functions_core.dart';
import 'package:frontend/widgets/divider.dart';
import 'package:frontend/widgets/tab_button.dart';
import 'package:frontend/widgets/text.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  final Function(bool)? showBottomBar;
  final Function(int)? navigateBottomBar;
  const NotificationScreen(
      {super.key, this.showBottomBar, this.navigateBottomBar});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int selectedTabIndex = 0;
  List<Announcement>? listFridgeAnnouncements;
  List<Announcement>? listCommunityAnnouncements;

  @override
  void initState() {
    super.initState();
    fetchFridgeAnnouncements();
    fetchCommunityAnnouncements();
  }

  void fetchFridgeAnnouncements() async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    final data = await NotificationService.getFridgeNotifications(
        fridgeId: user!.fridgeId!);

    final now = DateTime.now();
    List<Announcement> filteredAnnouncements = data.where((announcement) {
      print('announcement: ${announcement.createdAt}');
      var expDate = announcement.createdAt != null
          ? DateTime(
              announcement.createdAt!.year,
              announcement.createdAt!.month,
              announcement.createdAt!.day,
              9,
              0,
              0)
          : now;
      return expDate.isBefore(now);
    }).toList();
    setState(() {
      listFridgeAnnouncements = filteredAnnouncements;
    });
    for (Announcement announcement in filteredAnnouncements) {
      print('announcement: ${announcement.toJson()}');
    }
  }

  void fetchCommunityAnnouncements() async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    listCommunityAnnouncements =
        await NotificationService.getCommunityNotifications(
            targetId: user!.id!);
    setState(() {});
  }

  void goBackButton() {
    Navigate.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white["c900"]!,
      body: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        child: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16)),
                    color: MyColors.white["c900"]!,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                                alignment: Alignment.center,
                                child: MyText(
                                    text: "Thông báo",
                                    decoration: TextDecoration.none,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: MyColors.grey["c800"]!)),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      const MyDivider(),
                      Column(
                        children: [
                          SizedBox(height: 10),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: MyColors
                                        .primary["CulturalYellow"]!["c50"]!,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    MyTabButton(
                                      title: 'Tủ lạnh',
                                      isSelected: selectedTabIndex == 0,
                                      onTap: () {
                                        setState(() {
                                          selectedTabIndex = 0;
                                        });
                                      },
                                    ),
                                    MyTabButton(
                                      title: 'Cộng đồng',
                                      isSelected: selectedTabIndex == 1,
                                      onTap: () {
                                        setState(() {
                                          selectedTabIndex = 1;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
                selectedTabIndex == 0
                    ? renderTab(selectedTabIndex)
                    : renderTab(selectedTabIndex),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget renderTab(int index) {
    List<Announcement>? announcements =
        index == 0 ? listFridgeAnnouncements : listCommunityAnnouncements;
    Map<String, List<Announcement>> groupedData =
        groupAnnouncementsByDate(announcements ?? []);
    return Expanded(
      child: Container(
        padding:
            const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
        color: MyColors.primary["CulturalYellow"]!["c50"]!,
        child: Container(
          decoration: BoxDecoration(
              color: MyColors.white["c900"]!,
              borderRadius: BorderRadius.circular(20)),
          child: announcements == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : announcements.isEmpty
                  ? Center(
                      child: MyText(
                          text: "Không có thông báo",
                          fontSize: FontSize.z16,
                          fontWeight: FontWeight.w700,
                          color: MyColors.grey["c800"]!),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: groupedData.keys.map((date) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 10),
                                child: MyText(
                                  text: date,
                                  fontSize: FontSize.z18,
                                  fontWeight: FontWeight.w700,
                                  color: MyColors.grey["c800"]!,
                                ),
                              ),
                              ...groupedData[date]!.map((announcement) {
                                return Column(
                                  children: [
                                    announcementItem(announcement),
                                  ],
                                );
                              }).toList(),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
        ),
      ),
    );
  }

  Widget announcementItem(Announcement announcement) {
    UserModel? user = announcement.user;
    Dish? dish = announcement.dish;
    Category? category = announcement.category;
    return GestureDetector(
      onTap: () {
        redirectAnnouncementDetail(announcement);
      },
      child: Container(
        padding: const EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 22),
        color: announcement.read == true
            ? Colors.transparent
            : MyColors.grey["c100"],
        child: Column(
          children: [
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dish != null
                    ? Image.network(
                        FunctionCore.convertImageUrl(dish.image!),
                        width: 88,
                      )
                    : category != null
                        ? Image.asset(category.icon!, width: 50)
                        : const Image(
                            image: AssetImage('assets/images/logo.png'),
                            width: 88,
                            height: 88,
                          ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 4),
                      MyText(
                          text: announcement.type == 'community'
                              ? dish!.description!
                              : 'Hết hạn',
                          fontSize: FontSize.z13,
                          fontWeight: FontWeight.w500,
                          color: MyColors.grey["c500"]!),
                      const SizedBox(height: 4),
                      user != null
                          ? MyText(
                              text:
                                  '${user.displayName} đã bày tỏ cảm xúc vào bài viết của bạn',
                              fontSize: FontSize.z14,
                              fontWeight: FontWeight.w700,
                              color: MyColors.grey["c700"]!)
                          : category != null
                              ? MyText(
                                  text:
                                      '${category.label} cần được tiêu thụ gấp trong hôm nay!',
                                  fontSize: FontSize.z14,
                                  fontWeight: FontWeight.w700,
                                  color: MyColors.grey["c700"]!)
                              : Container(),
                      const SizedBox(height: 4),
                      MyText(
                          text:
                              FunctionCore.formatDate(announcement.createdAt!),
                          fontSize: FontSize.z12,
                          fontWeight: FontWeight.w600,
                          color: MyColors.grey["c300"]!),
                      const SizedBox(height: 4),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void redirectAnnouncementDetail(Announcement announcement) async {
    if (announcement.type == 'community') {
      if (announcement.read == false) {
        await NotificationService.readNotification(id: announcement.id!);
        readNotification(listCommunityAnnouncements, announcement.id!);
      }
      Navigate.pushNamed(RouterCommunity.dishDetail,
          arguments: {'dish': announcement.dish});
    }
    if (announcement.type == 'fridge') {
      if (announcement.read == false) {
        await NotificationService.readNotification(id: announcement.id!);
        readNotification(listFridgeAnnouncements, announcement.id!);
      }
      if (announcement.category!.deleted == false) {
        await CategoryService().deleteCache();
        widget.navigateBottomBar!(0);
        Provider.of<CategoryProvider>(context, listen: false)
            .sortTypeChange(value: SortType.expiryDate);
        Provider.of<CategoryProvider>(context, listen: false)
            .viewTypeChange(value: ViewType.list);
        Provider.of<CategoryProvider>(context, listen: false)
            .classifyChange(value: false);
        Provider.of<CategoryProvider>(context, listen: false)
            .positionTabChange(value: announcement.category!.positionId!);
      } else {
        FunctionCore.showSnackBar(
            context, '${announcement.category!.label} đã bị xóa khỏi tủ lạnh');
      }
    }
  }

  void readNotification(List<Announcement>? announcements, int id) {
    setState(() {
      announcements!.firstWhere((element) => element.id == id).read = true;
    });
  }

  Map<String, List<Announcement>> groupAnnouncementsByDate(
      List<Announcement> announcements) {
    Map<String, List<Announcement>> groupedData = {};

    for (var announcement in announcements) {
      String dateKey = formatDate(announcement.createdAt!);

      if (!groupedData.containsKey(dateKey)) {
        groupedData[dateKey] = [];
      }
      groupedData[dateKey]!.add(announcement);
    }

    return groupedData;
  }

  String formatDate(DateTime date) {
    DateTime dateConvert = DateTime(date.year, date.month, date.day);
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime yesterday = DateTime(now.year, now.month, now.day - 1);

    if (dateConvert.isAtSameMomentAs(today)) {
      return 'Hôm nay';
    } else if (dateConvert.isAtSameMomentAs(yesterday)) {
      return 'Hôm qua';
    } else {
      return DateFormat('yyyy-MM-dd').format(date);
    }
  }
}
