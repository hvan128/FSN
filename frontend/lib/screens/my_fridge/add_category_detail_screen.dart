// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/modals/alert_modal.dart';
import 'package:frontend/components/modals/modal_classify.dart';
import 'package:frontend/config.dart';
import 'package:frontend/models/category/category.dart';
import 'package:frontend/models/user/user.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/navigation/router/community.dart';
import 'package:frontend/navigation/router/my_fridge.dart';
import 'package:frontend/provider/category.dart';
import 'package:frontend/provider/notification.dart';
import 'package:frontend/services/notification/local_notification.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/type.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/functions_core.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/date_picker.dart';
import 'package:frontend/widgets/drop-down.dart';
import 'package:frontend/widgets/header.dart';
import 'package:frontend/widgets/input_form.dart';
import 'package:frontend/widgets/text.dart';
import 'package:frontend/widgets/text_area.dart';
import 'package:provider/provider.dart';

class AddCategoryDetailScreen extends StatefulWidget {
  final Category? category;

  const AddCategoryDetailScreen({super.key, this.category});

  @override
  State<AddCategoryDetailScreen> createState() =>
      _AddCategoryDetailScreenState();
}

class _AddCategoryDetailScreenState extends State<AddCategoryDetailScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Item>? listUnits;
  final List<Item> listPositions = [
    Item(
      label: "Tủ lạnh",
      value: '1',
    ),
    Item(
      label: "Tủ đông",
      value: '2',
    ),
    Item(
      label: "Bếp",
      value: '3',
    ),
    Item(
      label: "Khác",
      value: '4',
    )
  ];
  final List<Item> listSubPositions = [
    Item(
      label: "Không có",
      value: '0',
    ),
  ];
  String? position;
  String? unit;
  String? subPosition;
  DateTime? expDate;
  DateTime? manufactureDate;
  int quantity = 1;
  String note = '';
  String? tips;

  @override
  void initState() {
    super.initState();
    _controller.text = widget.category!.label!;
    listUnits = FunctionCore.getUnitList(widget.category!.type!);
    position = listPositions.first.value;
    unit = listUnits!.first.value;
    subPosition = listSubPositions.first.value;
    manufactureDate = DateTime.now();
    expDate =
        DateTime.now().add(Duration(days: widget.category!.defaultDuration!));
    tips = FunctionCore.getListCategoryByType(widget.category!.type!)!
        .firstWhere((e) => e.value == widget.category!.value!)
        .note;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void searchDish() {
    Navigate.pushNamed(RouterCommunity.searchDish,
        arguments: {'searchText': widget.category?.label});
  }

  @override
  Widget build(BuildContext context) {
    final type = foods
        .firstWhere((element) => element.value == widget.category?.type)
        .label;
    return Scaffold(
        backgroundColor: MyColors.primary['CulturalYellow']!['c50']!,
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SafeArea(
              child: Column(children: [
            MyHeader(
              title: "Thêm đồ ăn",
              bgColor: MyColors.white['c900']!,
              rightIcon: Row(
                children: [
                  IconButton(
                    onPressed: searchDish,
                    icon: Icon(
                      Icons.saved_search,
                      size: 32,
                      color: MyColors.grey['c900'],
                    ),
                  ),
                  tips == null
                      ? const SizedBox()
                      : IconButton(
                          onPressed: moreInformation,
                          icon: Icon(
                            Icons.lightbulb_outline,
                            size: 28,
                            color: MyColors.grey['c900'],
                          ),
                        ),
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(children: [
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: MyColors.grey['c100']!,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(children: [
                                const SizedBox(
                                  height: 22,
                                ),
                                Row(children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: MyColors.primary[
                                            'CulturalYellow']!['c100']!,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: MyColors.grey['c300']!,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: MyColors.grey['c300']!,
                                            blurRadius: 2,
                                            offset: const Offset(1, 2),
                                          )
                                        ]),
                                    child: SizedBox(
                                      height: 60,
                                      width: 60,
                                      child: Image.asset(
                                        widget.category!.icon!,
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 80,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 2),
                                              decoration: BoxDecoration(
                                                color: MyColors.primary[
                                                    'CulturalYellow']!['c800']!,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: MyColors.primary[
                                                            'CulturalYellow']![
                                                        'c800']!,
                                                    blurRadius: 4,
                                                    offset: const Offset(1, 2),
                                                  )
                                                ],
                                              ),
                                              child: MyText(
                                                text: type,
                                                fontSize: FontSize.z16,
                                                fontWeight: FontWeight.w500,
                                                color: MyColors.white['c900']!,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            TextField(
                                              controller: _controller,
                                              onChanged: (value) {
                                                setState(() {
                                                  _controller.text = value;
                                                });
                                              },
                                              style: TextStyle(
                                                color: MyColors.grey['c900']!,
                                                fontSize: FontSize.z16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: MyColors
                                                          .grey['c500']!),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 2,
                                                      color: MyColors.primary[
                                                              'CulturalYellow']![
                                                          'c600']!),
                                                ),
                                              ),
                                            )
                                          ]),
                                    ),
                                  )
                                ]),
                                const SizedBox(
                                  height: 20,
                                ),
                                _buildForm(),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: MyButton(
                                      text: 'Thêm',
                                      onPressed: () {
                                        onPressAdd();
                                      }),
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ])),
                          const SizedBox(
                            height: 32,
                          )
                        ]))))
          ])),
        ));
  }

  Widget _buildForm() {
    return Column(children: [
      InputForm(
          label: 'Số lượng',
          content: Container(
            width: 110,
            decoration: BoxDecoration(
                color: MyColors.primary['CulturalYellow']!['c800']!,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: MyColors.grey['c300']!,
                    blurRadius: 4,
                    offset: const Offset(1, 2),
                  )
                ]),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: MyColors.primary['CulturalYellow']!['c100']!,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            if (quantity > 1) {
                              setState(() {
                                quantity--;
                              });
                            }
                          },
                          icon: const Icon(Icons.remove, size: 15))),
                  MyText(
                      text: '$quantity',
                      fontSize: FontSize.z15,
                      fontWeight: FontWeight.w700,
                      color: MyColors.white['c900']!),
                  Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: MyColors.primary['CulturalYellow']!['c100']!,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: const Icon(Icons.add, size: 15))),
                ]),
          )),
      const SizedBox(
        height: 20,
      ),
      InputForm(
          label: 'Đơn vị',
          content: MyDropDownButton(
            items: listUnits ?? [Item(value: 'piece', label: 'Cái')],
            onSelected: (value) => setState(() {
              unit = value;
            }),
          )),
      const SizedBox(
        height: 20,
      ),
      InputForm(
          label: 'Vị trí',
          content: MyDropDownButton(
            items: listPositions,
            onSelected: (value) => setState(() {
              position = value;
            }),
          )),
      const SizedBox(
        height: 20,
      ),
      // InputForm(
      //     label: 'Vị trí con',
      //     content: MyDropDownButton(
      //         items: listSubPositions,
      //         otherAction: Item(
      //           value: 'add',
      //           label: 'Tạo mới',
      //         ),
      //         onTapOtherAction: () {},
      //         onSelected: (value) => setState(() {
      //               subPosition = value;
      //             }))),
      // const SizedBox(
      //   height: 20,
      // ),
      InputForm(
        label: 'Ngày nhập',
        content: MyDatePicker(
          onDateSelected: (DateTime date) {
            setState(() {
              manufactureDate = date;
            });
          },
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      InputForm(
        label: 'Ngày hết hạn',
        content: MyDatePicker(
          label: 'Date of birth',
          defaultValue: expDate,
          onDateSelected: (DateTime date) {
            setState(() {
              expDate = date;
            });
          },
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      // Container(
      //     // padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      //     decoration: BoxDecoration(
      //       color: MyColors.white['c900']!,
      //       borderRadius: BorderRadius.circular(20),
      //     ),
      //     child: Theme(
      //       data: ThemeData().copyWith(dividerColor: Colors.transparent),
      //       child: ExpansionTile(
      //         title: MyText(
      //           text: 'Mẹo',
      //           fontSize: FontSize.z14,
      //           fontWeight: FontWeight.w600,
      //           color: MyColors.grey['c900']!,
      //         ),
      //         children: [
      //           Padding(
      //             padding: EdgeInsets.only(left: 16, bottom: 32, right: 12),
      //             child: MyText(
      //                 text: 'Sức khỏe\n\n'
      //                     '- Giàu chất xơ, giúp cải thiện tiêu hóa và ngăn ngừa táo bón.\n'
      //                     '- Chứa nhiều vitamin C và K, giúp tăng cường hệ miễn dịch và bảo vệ tế bào khỏi tổn thương.\n'
      //                     '- Có chất chống oxy hóa giúp giảm nguy cơ mắc bệnh tim và ung thư.\n'
      //                     '- Chứa chất chống viêm, có thể giúp giảm viêm và đau khớp.\n'
      //                     '- Giúp kiểm soát cân nặng, vì quả lê có lượng calo thấp nhưng lại tạo cảm giác no lâu.\n\n'
      //                     'Ăn uống\n\n'
      //                     '- Có thể ăn trực tiếp hoặc chế biến thành nhiều món ăn khác nhau như salad, nước ép, và mứt.\n'
      //                     '- Nên ăn lê cùng với vỏ để tận dụng hết các chất dinh dưỡng và chất xơ.\n\n'
      //                     'Bảo quản\n\n'
      //                     '- Bảo quản quả lê ở nhiệt độ phòng nếu bạn muốn chúng chín nhanh hơn.\n'
      //                     '- Để kéo dài thời gian sử dụng, hãy bảo quản trong tủ lạnh.\n'
      //                     '- Kiểm tra thường xuyên và loại bỏ những quả lê bị dập hoặc hỏng để tránh lây lan đến các quả khác.',
      //                 fontSize: FontSize.z14,
      //                 fontWeight: FontWeight.w700,
      //                 color: MyColors.grey['c900']!),
      //           )
      //         ],
      //       ),
      //     )),
      MyTextArea(
          hasError: false,
          label: 'Ghi chú',
          hintText: 'Nhấn để viết ghi nhớ',
          onChange: (value) {
            note = value;
          })
    ]);
  }

  void onPressAdd() async {
    final currentUser = Provider.of<UserProvider>(
            Navigate().navigationKey.currentContext!,
            listen: false)
        .user!;
    final fridgeId = currentUser.fridgeId;
    final users = await getUsers(fridgeId!);
    await ApiService.post(Config.CATEGORIES_API, {
      'label': widget.category!.label,
      'value': widget.category!.value,
      'icon': widget.category!.icon,
      'type': widget.category!.type,
      'quantity': quantity,
      'unit': unit,
      'positionId': int.parse(position!),
      'subPositionId': int.parse(subPosition!),
      'manufactureDate': manufactureDate!.toIso8601String(),
      'expiryDate': expDate!.toIso8601String(),
      'fridgeId': fridgeId
    }).then((value) async {
      if (value == null) {
        return;
      } else {
        final data = jsonDecode(value.toString())['data'];
        Category category = Category.fromJson(data);
        final DateTime expiryDate = category.expiryDate!;
        var notificationProvider =
            Provider.of<NotificationProvider>(context, listen: false);
        int notificationDaysInAdvance =
            notificationProvider.notificationDaysInAdvance;
        int duration = expiryDate.difference(DateTime.now()).inDays;
        int notificationDay = duration > notificationDaysInAdvance
            ? expiryDate.day - notificationDaysInAdvance
            : expiryDate.day;
        if (notificationProvider.getExpirationNotification == true) {
          NotificationService.showNotification(
            id: category.id!,
            title: 'Hết hạn',
            body: '${category.label} cần được tiêu thụ gấp trong hôm nay!',
            scheduled: true,
            time: DateTime(
                expiryDate.year, expiryDate.month, notificationDay, 9, 0, 0),
          );
        }
        for (var element in users) {
          if (element.id != currentUser.id && element.fcmToken != null) {
            ApiService.post(Config.SEND_NOTIFICATION_API, {
              'receiverToken': element.fcmToken,
              'title': 'Tủ lạnh',
              'body':
                  '${currentUser.displayName} đã thêm mới một đồ ăn vào tủ lạnh!',
              'data': {
                'type': 'category',
                'categoryId': category.id.toString(),
              }
            });
            final expiryDate =
                DateTime(expDate!.year, expDate!.month, expDate!.day, 9, 0, 0);
            ApiService.post(Config.SEND_NOTIFICATION_API, {
              'receiverToken': element.fcmToken,
              'title': 'Hết hạn',
              'body': '${category.label} cần được tiêu thụ gấp trong hôm nay!',
              'data': {
                'type': 'schedule',
                'id': category.id.toString(),
                'time': expiryDate.toIso8601String(),
              }
            });
          }
        }
      }
    });

    await APICacheManager().deleteCache('categories_${int.parse(position!)}');
    await APICacheManager().deleteCache('categories');
    final categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    categoryProvider.positionTabChange(value: int.parse(position!));
    categoryProvider.sortTypeChange(value: SortType.manufactureDate);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => const HomeScreen(
                  tabIndex: 0,
                )),
        ModalRoute.withName(RouterMyFridge.addCategory));
    showDialog(
        context: context,
        builder: (context) {
          return MyAlert(
            alertType: AlertType.success,
            position: AlertPosition.topCenter,
            title: 'Thành công',
            description:
                'Thêm đồ ăn ${widget.category!.label} vào $position thành công!',
          );
        });
  }

  Future<List<UserModel>> getUsers(int? fridgeId) async {
    List<UserModel> listUsers = [];
    await ApiService.get('${Config.USER_API}/fridge/$fridgeId').then((value) {
      if (value != null && value != 'No data') {
        final data = jsonDecode(value.toString())['data'];
        listUsers = userFromJson(data);
      }
    });
    return listUsers;
  }

  void moreInformation() {
    showDialog(
        context: context,
        builder: (context) => Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                          text: tips!,
                          fontSize: FontSize.z14,
                          fontWeight: FontWeight.w700,
                          color: MyColors.grey['c900']!),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigate.pop();
                                },
                                child: const Text('OK')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
