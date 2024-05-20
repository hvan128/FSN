
import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/divider.dart';
import 'package:frontend/widgets/text.dart';
import 'package:intl/intl.dart';

import 'shared/picker_header.dart';
import 'month_view.dart';
import 'shared/utils.dart';

/// Displays a grid of months for a given year and allows the user to select a
/// date.
///
/// Months are arranged in a rectangular grid with one column for each month of the
/// year. Controls are provided to change the year that the grid is
/// showing.
///
/// The month picker widget is rarely used directly. Instead, consider using
/// [showDatePickerDialog], which will create a dialog that uses this.
///
/// See also:
///
///  * [showDatePickerDialog], which creates a Dialog that contains a
///    [DatePicker].
///
class MonthPicker extends StatefulWidget {
  /// Creates a month picker.
  ///
  /// It will display a grid of months for the [initialDate]'s year. if that
  /// is null, `DateTime.now()` will be used. The month
  /// indicated by [selectedDate] will be selected if provided.
  ///
  /// The optional [onDateSelected] callback will be called if provided when a date
  /// is selected.
  ///
  /// The [minDate] is the earliest allowable date. The [maxDate] is the latest
  /// allowable date. [initialDate] and [selectedDate] must either fall between
  /// these dates, or be equal to one of them.
  ///
  /// The [currentDate] represents the current day (i.e. today). This
  /// date will be highlighted in the day grid. If null, the date of
  /// `DateTime.now()` will be used.
  ///
  /// For each of these [DateTime] parameters, only
  /// their year & month are considered. Their time & day fields are ignored.
  MonthPicker({
    super.key,
    required this.minDate,
    required this.maxDate,
    this.initialDate,
    this.currentDate,
    this.selectedDate,
    this.enabledCellsTextStyle,
    this.enabledCellsDecoration,
    this.disabledCellsTextStyle,
    this.disabledCellsDecoration,
    this.currentDateTextStyle,
    this.currentDateDecoration,
    this.selectedCellTextStyle,
    this.selectedCellDecoration,
    this.onLeadingDateTap,
    this.onDateSelected,
    this.leadingDateTextStyle,
    this.slidersColor,
    this.slidersSize,
    this.highlightColor,
    this.splashColor,
    this.splashRadius,
    required this.title,
    this.onSubmit,
  }) {
    assert(!minDate.isAfter(maxDate), "minDate can't be after maxDate");

    assert(
      () {
        if (initialDate == null) return true;
        final init = DateUtilsX.monthOnly(initialDate!);

        final min = DateUtilsX.monthOnly(minDate);

        return init.isAfter(min) || init.isAtSameMomentAs(min);
      }(),
      'initialDate $initialDate must be on or after minDate $minDate.',
    );
    assert(
      () {
        if (initialDate == null) return true;
        final init = DateUtilsX.monthOnly(initialDate!);

        final max = DateUtilsX.monthOnly(maxDate);
        return init.isBefore(max) || init.isAtSameMomentAs(max);
      }(),
      'initialDate $initialDate must be on or before maxDate $maxDate.',
    );
  }

  /// The date which will be displayed on first opening.
  /// If not specified, the picker will default to `DateTime.now()` date.
  ///
  /// Note that only year & month are considered. time & day fields are ignored.
  final DateTime? initialDate;

  /// The date to which the picker will consider as current date. e.g (today).
  /// If not specified, the picker will default to `DateTime.now()` date.
  ///
  /// Note that only year & month are considered. time & day fields are ignored.
  final DateTime? currentDate;

  /// The initially selected date when the picker is first opened.
  ///
  /// Note that only year & month are considered. time & day fields are ignored.
  final DateTime? selectedDate;

  /// Called when the user picks a date.
  final ValueChanged<DateTime>? onDateSelected;

  /// The earliest date the user is permitted to pick.
  ///
  /// This date must be on or before the [maxDate].
  ///
  /// Note that only year & month are considered. time & day fields are ignored.
  final DateTime minDate;

  /// The latest date the user is permitted to pick.
  ///
  /// This date must be on or after the [minDate].
  ///
  /// Note that only year & month are considered. time & day fields are ignored.
  final DateTime maxDate;

  /// Called when the user tap on the leading date.
  final VoidCallback? onLeadingDateTap;

  /// The text style of cells which are selectable.
  ///
  /// defaults to [TextTheme.titleLarge] with a [FontWeight.normal]
  /// and [ColorScheme.onSurface] color.
  final TextStyle? enabledCellsTextStyle;

  /// The cell decoration of cells which are selectable.
  ///
  /// defaults to empty [BoxDecoration].
  final BoxDecoration? enabledCellsDecoration;

  /// The text style of cells which are not selectable.
  ///
  /// defaults to [TextTheme.titleLarge] with a [FontWeight.normal]
  /// and [ColorScheme.onSurface] color with 30% opacity.
  final TextStyle? disabledCellsTextStyle;

  /// The cell decoration of cells which are not selectable.
  ///
  /// defaults to empty [BoxDecoration].
  final BoxDecoration? disabledCellsDecoration;

  /// The text style of the current date.
  ///
  /// defaults to [TextTheme.titleLarge] with a [FontWeight.normal]
  /// and [ColorScheme.primary] color.
  final TextStyle? currentDateTextStyle;

  /// The cell decoration of the current date.
  ///
  /// defaults to circle stroke border with [ColorScheme.primary] color.
  final BoxDecoration? currentDateDecoration;

  /// The text style of selected cell.
  ///
  /// defaults to [TextTheme.titleLarge] with a [FontWeight.normal]
  /// and [ColorScheme.onPrimary] color.
  final TextStyle? selectedCellTextStyle;

  /// The cell decoration of selected cell.
  ///
  /// defaults to circle with [ColorScheme.primary] color.
  final BoxDecoration? selectedCellDecoration;

  /// The text style of leading date showing in the header.
  ///
  /// defaults to `18px` with a [FontWeight.bold]
  /// and [ColorScheme.primary] color.
  final TextStyle? leadingDateTextStyle;

  /// The color of the page sliders.
  ///
  /// defaults to [ColorScheme.primary] color.
  final Color? slidersColor;

  /// The size of the page sliders.
  ///
  /// defaults to `20px`.
  final double? slidersSize;

  /// The splash color of the ink response.
  ///
  /// defaults to the color of [selectedCellDecoration] with 30% opacity,
  /// if [selectedCellDecoration] is null will fall back to
  /// [ColorScheme.onPrimary] with 30% opacity.
  final Color? splashColor;

  /// The highlight color of the ink response when pressed.
  ///
  /// defaults to [Theme.highlightColor].
  final Color? highlightColor;

  /// The radius of the ink splash.
  final double? splashRadius;

  /// The title of month picker
  final String title;

  /// Submit action
  final VoidCallback? onSubmit;

  @override
  State<MonthPicker> createState() => _MonthPickerState();
}

class _MonthPickerState extends State<MonthPicker> {
  DateTime? _displayedMonth;
  DateTime? _selectedDate;

  final GlobalKey _pageViewKey = GlobalKey();
  final _itemKey = <GlobalKey>[];

  late ScrollController _controller;

  int get yearsCount => (widget.maxDate.year - widget.minDate.year) + 1;

  @override
  void initState() {
    _displayedMonth = DateUtilsX.monthOnly(
      widget.selectedDate ?? widget.initialDate ?? DateTime.now(),
    );

    _selectedDate = widget.selectedDate != null
        ? DateUtilsX.monthOnly(widget.selectedDate!)
        : null;

    if (widget.initialDate == null && widget.selectedDate == null) {
      // to bottom
      _controller = ScrollController(
        initialScrollOffset: (yearsCount - 1) * 254.0,
      );
    } else {
      // init to selected or initial item
      _controller = ScrollController(
        initialScrollOffset: 254.0 *
            ((widget.selectedDate ?? widget.initialDate ?? DateTime.now())
                    .year -
                widget.minDate.year),
      );
    }

    for (int i = 0; i < yearsCount; i++) {
      _itemKey.add(GlobalKey());
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MonthPicker oldWidget) {
    // there is no need to check for the displayed month because it changes via
    // page view and not the initial date.
    // but for makeing debuging easy, we will navigate to the initial date again
    // if it changes.
    if (oldWidget.initialDate != widget.initialDate) {
      // _displayedMonth = DateUtils.dateOnly(widget.initialDate ?? DateTime.now());
      _displayedMonth = DateUtilsX.yearOnly(
        widget.selectedDate ?? widget.initialDate ?? DateTime.now(),
      );
    }

    if (oldWidget.selectedDate != _selectedDate) {
      // _selectedDate = widget.selectedDate != null ? DateUtils.dateOnly(widget.selectedDate!) : null;
      _selectedDate = widget.selectedDate != null
          ? DateUtilsX.monthOnly(widget.selectedDate!)
          : null;
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    //
    //! enabled
    //
    //

    final TextStyle enabledCellsTextStyle = widget.enabledCellsTextStyle ??
        TextStyle(
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w700,
          color: MyColors.primary['KiduBlue']!['c700']!,
          fontStyle: FontStyle.normal,
          height: 18 / FontSize.z14,
          fontSize: FontSize.z14,
        );

    final BoxDecoration enabledCellsDecoration =
        widget.enabledCellsDecoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            );

    //
    //! disabled
    //
    //

    final TextStyle disabledCellsTextStyle = widget.disabledCellsTextStyle ??
        TextStyle(
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w700,
          color: MyColors.grey['c400']!,
          fontStyle: FontStyle.normal,
          height: 18 / FontSize.z14,
          fontSize: FontSize.z14,
        );

    final BoxDecoration disbaledCellsDecoration =
        widget.disabledCellsDecoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            );

    //
    //! current
    //
    //

    final TextStyle currentDateTextStyle = enabledCellsTextStyle;

    final BoxDecoration currentDateDecoration = enabledCellsDecoration;

    //
    //! selected.
    //
    //

    final TextStyle selectedCellTextStyle = widget.selectedCellTextStyle ??
        TextStyle(
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w700,
          color: MyColors.white['c900']!,
          fontStyle: FontStyle.normal,
          height: 18 / FontSize.z14,
          fontSize: FontSize.z14,
        );

    final BoxDecoration selectedCellDecoration =
        widget.selectedCellDecoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: MyColors.primary['KiduBlue']!['c700']!,
            );

    //
    //
    //
    //! header
    final leadingDateTextStyle = widget.leadingDateTextStyle ??
        TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        );

    //
    //! splash
    final splashColor = widget.splashColor ??
        selectedCellDecoration.color?.withOpacity(0.3) ??
        colorScheme.primary.withOpacity(0.3);

    final highlightColor =
        widget.highlightColor ?? Theme.of(context).highlightColor;
    //
    //

    final formater = DateFormat('MMM, yyyy');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        PickerHeader(
          title: widget.title,
          leadingDateTextStyle: leadingDateTextStyle,
          onDateTap: () => widget.onLeadingDateTap?.call(),
          selectedLabel: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: MyColors.primary['KiduBlue']!['c100']!,
            ),
            child: Center(
              child: MyText(
                text: formater.format(_selectedDate ?? _displayedMonth!),
                fontSize: FontSize.z14,
                fontWeight: FontWeight.w700,
                color: MyColors.primary['KiduBlue']!['c700']!,
                lineHeight: 18 / FontSize.z14,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const MyDivider(),
        SizedBox(
          height: (MediaQuery.of(context).size.height - 50) * 0.5,
          child: ListView.builder(
            controller: _controller,
            addRepaintBoundaries: false,
            prototypeItem: SizedBox(
              height: 254,
            ),
            scrollDirection: Axis.vertical,
            key: _pageViewKey,
            itemCount: yearsCount,
            itemBuilder: (context, index) {
              final DateTime year = DateTime(
                widget.minDate.year + index,
              );

              return Column(
                key: _itemKey[index],
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding:const  EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: MyColors.primary['KiduBlue']!['c50'],
                    ),
                    child: MyText(
                      text: year.year.toString(),
                      fontSize: FontSize.z15,
                      fontWeight: FontWeight.w700,
                      color: MyColors.primary['KiduBlue']!['c500']!,
                      lineHeight: 1.2,
                      letterSpacing: -0.15,
                    ),
                  ),
                 const  SizedBox(height: 8),
                  MonthView(
                    key: ValueKey<DateTime>(year),
                    currentDate: widget.currentDate != null
                        ? DateUtilsX.monthOnly(widget.currentDate!)
                        : DateUtilsX.monthOnly(DateTime.now()),
                    maxDate: DateUtilsX.monthOnly(widget.maxDate),
                    minDate: DateUtilsX.monthOnly(widget.minDate),
                    displayedDate: year,
                    selectedDate: _selectedDate,
                    enabledCellsDecoration: enabledCellsDecoration,
                    enabledCellsTextStyle: enabledCellsTextStyle,
                    disabledCellsDecoration: disbaledCellsDecoration,
                    disabledCellsTextStyle: disabledCellsTextStyle,
                    currentDateDecoration: currentDateDecoration,
                    currentDateTextStyle: currentDateTextStyle,
                    selectedCellDecoration: selectedCellDecoration,
                    selectedCellTextStyle: selectedCellTextStyle,
                    highlightColor: highlightColor,
                    splashColor: splashColor,
                    splashRadius: widget.splashRadius,
                    onChanged: (value) {
                      final selected = DateUtilsX.monthOnly(value);
                      widget.onDateSelected?.call(selected);
                      setState(() {
                        _selectedDate = selected;
                      });
                    },
                  ),
                  if (index != yearsCount - 1) const SizedBox(height: 12),
                ],
              );
            },
          ),
        ),
        const MyDivider(),
       const  SizedBox(height: 12),
        MyButton(
          text: 'Continue',
          onPressed: widget.onSubmit,
        ),
      ],
    );
  }
}
