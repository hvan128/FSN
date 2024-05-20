import 'package:flutter/cupertino.dart';
import 'package:frontend/widgets/card_header.dart';

/// The `PickerHeader` class represents the header widget that is displayed above the calendar grid.
///
/// This widget includes information about the currently displayed date, as well as navigation controls
/// for moving to the next or previous page in the calendar.
///
/// ### Example:
///
/// ```dart
/// PickerHeader(
///   displayedDate: "December 2023",
///   centerLeadingDate: true,
///   onDateTap: () {
///     // Handle date tap action
///   },
///   onNextPage: () {
///     // Handle next page navigation
///   },
///   onPreviousPage: () {
///     // Handle previous page navigation
///   },
///   slidersColor: Colors.blue,
///   slidersSize: 20.0,
///   leadingDateTextStyle: TextStyle(
///     fontWeight: FontWeight.bold,
///     fontSize: 18.0,
///   ),
/// )
/// ```
///
/// See also:
///
///  * [LeadingDate], a widget that shows an indication of the opened year/month.
///
///
class PickerHeader extends StatelessWidget {
  /// Creates a new [PickerHeader] instance.
  ///
  /// The [displayedDate], [onDateTap], [onNextPage], [onPreviousPage], [slidersColor],
  /// [slidersSize], and [leadingDateTextStyle] parameters are required.
  const PickerHeader({
    super.key,
    this.onDateTap,
    this.onNextPage,
    this.onPreviousPage,
    required this.leadingDateTextStyle,
    this.title = '',
    this.selectedLabel,
  });

  /// the text style for the [displayedDate] in the header.
  final TextStyle leadingDateTextStyle;

  /// Called when the displayed date is tapped. This can
  /// be used to trigger actions related to selecting or
  /// interacting with the displayed date.
  final VoidCallback? onDateTap;

  /// called when the user wants to navigate to the next
  /// page in the calendar. This function is associated
  /// with the forward navigation control.
  final VoidCallback? onNextPage;

  /// called when the user wants to navigate to the
  /// previous page in the calendar. This function is
  /// associated with the backward navigation control.
  final VoidCallback? onPreviousPage;

  /// The title of picker
  final String title;

  final Widget? selectedLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardHeader(
          title: title,
        ),
        const SizedBox(height: 16),
        if (selectedLabel != null) selectedLabel!,
      ],
    );
  }
}
