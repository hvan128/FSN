
import 'package:flutter/material.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/theme/color.dart';

import 'month_picker.dart';
import 'shared/picker_type.dart';
import 'year_picker.dart';
import 'range_days_picker.dart';

/// Displays a grid of days for a given month and allows the user to select a
/// range of dates.
///
/// Days are arranged in a rectangular grid with one column for each day of the
/// week. Controls are provided to change the year and month that the grid is
/// showing.
///
///
class CalendarPicker extends StatefulWidget {
  /// Creates a calendar range picker.
  ///
  /// It will display a grid of days for the [initialDate]'s month. if that
  /// is null, `DateTime.now()` will be used. The day
  /// indicated by [selectedRange] will be selected if provided.
  ///
  /// The optional [onRangeSelected] callback will be called if provided
  /// when a range is selected.
  ///
  /// The user interface provides a way to change the year and the month being
  /// displayed. By default it will show the day grid, but this can be changed
  /// with [initialPickerType].
  ///
  /// The [minDate] is the earliest allowable date. The [maxDate] is the latest
  /// allowable date. [initialDate] and [selectedRange] must either fall between
  /// these dates, or be equal to one of them.
  ///
  /// The [currentDate] represents the current day (i.e. today). This
  /// date will be highlighted in the day grid. If null, the date of
  /// `DateTime.now()` will be used.
  ///
  /// For each of these [DateTime] parameters, only
  /// their dates are considered. Their time fields are ignored.
  CalendarPicker({
    super.key,
    required this.maxDate,
    required this.minDate,
    this.onRangeSelected,
    this.currentDate,
    this.initialDate,
    this.selectedRange,
    this.padding = const EdgeInsets.fromLTRB(22, 12, 22, 32),
    this.initialPickerType = PickerType.days,
    this.daysOfTheWeekTextStyle,
    this.enabledCellsTextStyle,
    this.enabledCellsDecoration = const BoxDecoration(),
    this.disabledCellsTextStyle,
    this.disabledCellsDecoration = const BoxDecoration(),
    this.currentDateTextStyle,
    this.currentDateDecoration,
    this.selectedCellsTextStyle,
    this.selectedCellsDecoration,
    this.singelSelectedCellTextStyle,
    this.singelSelectedCellDecoration,
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
  }

  /// The initially selected date range when the picker is first opened.
  /// If the specified range contains the [initialDate], that range will be selected.
  ///
  /// Note that only dates are considered. time fields are ignored.
  final DateTimeRange? selectedRange;

  /// The date to which the picker will consider as current date. e.g (today).
  /// If not specified, the picker will default to today's date.
  ///
  /// Note that only dates are considered. time fields are ignored.
  final DateTime? currentDate;

  /// The date to which the picker will be initially opened.
  /// If not specified, the picker will default to today's date.
  ///
  /// Note that only dates are considered. time fields are ignored.
  final DateTime? initialDate;

  /// Called when the user picks a range.
  final ValueChanged<DateTimeRange>? onRangeSelected;

  /// The earliest date the user is permitted to pick.
  ///
  /// This date must be on or before the [maxDate].
  ///
  /// Note that only dates are considered. time fields are ignored.
  final DateTime minDate;

  /// The latest date the user is permitted to pick.
  ///
  /// This date must be on or after the [minDate].
  ///
  /// Note that only dates are considered. time fields are ignored.
  final DateTime maxDate;

  /// The initial display of the calendar picker.
  final PickerType initialPickerType;

  /// The amount of padding to be added around the [DatePicker].
  final EdgeInsets padding;

  /// The text style of the week days name in the header.
  ///
  /// defaults to [TextTheme.titleSmall] with a [FontWeight.bold],
  /// a `14` font size, and a [ColorScheme.onSurface] with 30% opacity.
  final TextStyle? daysOfTheWeekTextStyle;

  /// The text style of cells which are selectable.
  ///
  /// defaults to [TextTheme.titleLarge] with a [FontWeight.normal]
  /// and [ColorScheme.onSurface] color.
  final TextStyle? enabledCellsTextStyle;

  /// The cell decoration of cells which are selectable.
  ///
  /// defaults to empty [BoxDecoration].
  final BoxDecoration enabledCellsDecoration;

  /// The text style of cells which are not selectable.
  ///
  /// defaults to [TextTheme.titleLarge] with a [FontWeight.normal]
  /// and [ColorScheme.onSurface] color with 30% opacity.
  final TextStyle? disabledCellsTextStyle;

  /// The cell decoration of cells which are not selectable.
  ///
  /// defaults to empty [BoxDecoration].
  final BoxDecoration disabledCellsDecoration;

  /// The text style of the current date.
  ///
  /// defaults to [TextTheme.titleLarge] with a [FontWeight.normal]
  /// and [ColorScheme.primary] color.
  ///
  /// ### Note:
  /// If [currentDate] is within the selected range this will
  /// be override by [selectedCellsTextStyle]
  final TextStyle? currentDateTextStyle;

  /// The cell decoration of the current date.
  ///
  /// defaults to circle stroke border with [ColorScheme.primary] color.
  ///
  /// ### Note:
  /// If [currentDate] is within the selected range this will
  /// be override by [selectedCellsDecoration]
  final BoxDecoration? currentDateDecoration;

  /// The text style of selected cells within the range.
  ///
  /// defaults to [TextTheme.titleLarge] with a [FontWeight.normal]
  /// and [ColorScheme.onPrimaryContainer] color.
  final TextStyle? selectedCellsTextStyle;

  /// The cell decoration of selected cells within the range.
  ///
  /// defaults to circle with [ColorScheme.primaryContainer] color.
  final BoxDecoration? selectedCellsDecoration;

  /// The text style for a cell representing:
  ///
  /// 1. A single cell when initially selected.
  /// 2. The leading/trailing cell of a selected range.
  ///
  /// defaults to [TextTheme.titleLarge] with a [FontWeight.normal]
  /// and [ColorScheme.onPrimary] color
  final TextStyle? singelSelectedCellTextStyle;

  /// The decoration for a cell representing:
  ///
  /// 1. A single cell when initially selected.
  /// 2. The leading/trailing cell of a selected range.
  ///
  /// If not provided, `singelSelectedCellDecoration` is a circle with the color specified
  /// in `selectedCellsDecoration`, using [ColorScheme.primary].
  final BoxDecoration? singelSelectedCellDecoration;

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
  /// defaults to the color of [selectedCellsDecoration],
  /// if null will fall back to [ColorScheme.onPrimary] with 30% opacity.
  final Color? splashColor;

  /// The highlight color of the ink response when pressed.
  ///
  /// defaults to [Theme.highlightColor].
  final Color? highlightColor;

  /// The radius of the ink splash.
  final double? splashRadius;

  /// The title of picker
  final String title;

  /// Submit action
  final void Function(DateSubmit selectedDates)? onSubmit;

  @override
  State<CalendarPicker> createState() => _CalendarPickerState();
}

class _CalendarPickerState extends State<CalendarPicker> {
  PickerType? _pickerType;
  late DateTime _diplayedDate;
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;

  final GlobalKey _callendarKey = GlobalKey();

  void _onSubmit(PickerType type) {
    widget.onSubmit?.call(
      DateSubmit(
        type: type,
        date: _diplayedDate,
        start: _selectedStartDate,
        end: _selectedEndDate,
      ),
    );
    Navigate.pop();
  }

  @override
  void initState() {
    _pickerType = widget.initialPickerType;
    setState(() {
      _diplayedDate = DateUtils.dateOnly(widget.initialDate ?? DateTime.now());
    });

    if (widget.selectedRange != null) {
      _selectedStartDate = DateUtils.dateOnly(widget.selectedRange!.start);
      _selectedEndDate = DateUtils.dateOnly(widget.selectedRange!.end);
    }

    super.initState();
  }

  @override
  void didUpdateWidget(covariant CalendarPicker oldWidget) {
    if (widget.selectedRange != oldWidget.selectedRange) {
      if (widget.selectedRange == null) {
        _selectedStartDate = null;
        _selectedEndDate = null;
      } else {
        _selectedStartDate = DateUtils.dateOnly(widget.selectedRange!.start);
        _selectedEndDate = DateUtils.dateOnly(widget.selectedRange!.end);
      }
    }

    if (widget.initialDate != oldWidget.initialDate) {
      _diplayedDate = DateUtils.dateOnly(widget.initialDate ?? DateTime.now());
    }

    super.didUpdateWidget(oldWidget);
  }

  Widget _renderPicker() {
    switch (_pickerType!) {
      case PickerType.days:
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: RangeDaysPicker(
            onSubmit: () => _onSubmit(PickerType.days),
            title: widget.title,
            currentDate:
                DateUtils.dateOnly(widget.currentDate ?? DateTime.now()),
            initialDate: widget.initialDate,
            selectedEndDate: _selectedEndDate,
            selectedStartDate: _selectedStartDate,
            maxDate: DateUtils.dateOnly(widget.maxDate),
            minDate: DateUtils.dateOnly(widget.minDate),
            daysOfTheWeekTextStyle: widget.daysOfTheWeekTextStyle,
            enabledCellsTextStyle: widget.enabledCellsTextStyle,
            enabledCellsDecoration: widget.enabledCellsDecoration,
            disabledCellsTextStyle: widget.disabledCellsTextStyle,
            disabledCellsDecoration: widget.disabledCellsDecoration,
            currentDateDecoration: widget.currentDateDecoration,
            currentDateTextStyle: widget.currentDateTextStyle,
            selectedCellsDecoration: widget.selectedCellsDecoration,
            selectedCellsTextStyle: widget.selectedCellsTextStyle,
            singelSelectedCellTextStyle: widget.singelSelectedCellTextStyle,
            singelSelectedCellDecoration: widget.singelSelectedCellDecoration,
            slidersColor: widget.slidersColor,
            slidersSize: widget.slidersSize,
            leadingDateTextStyle: widget.leadingDateTextStyle,
            splashColor: widget.splashColor,
            highlightColor: widget.highlightColor,
            splashRadius: widget.splashRadius,
            onEndDateChanged: (date) {
              setState(() {
                _selectedEndDate = date;
              });

              // this should never be null
              if (_selectedStartDate != null) {
                widget.onRangeSelected?.call(
                  DateTimeRange(
                    start: _selectedStartDate!,
                    end: _selectedEndDate!,
                  ),
                );
              }
            },
            onStartDateChanged: (date) {
              setState(() {
                _selectedStartDate = date;
                _selectedEndDate = null;
              });
            },
          ),
        );
      case PickerType.months:
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: MonthPicker(
            title: widget.title,
            initialDate: widget.initialDate,
            selectedDate: _diplayedDate,
            maxDate: DateUtils.dateOnly(widget.maxDate),
            minDate: DateUtils.dateOnly(widget.minDate),
            currentDate:
                DateUtils.dateOnly(widget.currentDate ?? DateTime.now()),
            currentDateDecoration: widget.currentDateDecoration,
            currentDateTextStyle: widget.currentDateTextStyle,
            disabledCellsDecoration: widget.disabledCellsDecoration,
            disabledCellsTextStyle: widget.disabledCellsTextStyle,
            enabledCellsDecoration: widget.enabledCellsDecoration,
            enabledCellsTextStyle: widget.enabledCellsTextStyle,
            selectedCellDecoration: widget.singelSelectedCellDecoration,
            selectedCellTextStyle: widget.singelSelectedCellTextStyle,
            slidersColor: widget.slidersColor,
            slidersSize: widget.slidersSize,
            leadingDateTextStyle: widget.leadingDateTextStyle,
            splashColor: widget.splashColor,
            highlightColor: widget.highlightColor,
            splashRadius: widget.splashRadius,
            onDateSelected: (selectedMonth) {
              setState(() {
                _diplayedDate = selectedMonth;
              });
            },
            onSubmit: () => _onSubmit(PickerType.months),
          ),
        );
      case PickerType.years:
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: YearsPicker(
            // onSubmit: () => _onSubmit(PickerType.years),
            title: widget.title,
            selectedDate: null,
            initialDate: _diplayedDate,
            maxDate: DateUtils.dateOnly(widget.maxDate),
            minDate: DateUtils.dateOnly(widget.minDate),
            currentDate:
                DateUtils.dateOnly(widget.currentDate ?? DateTime.now()),
            currentDateDecoration: widget.currentDateDecoration,
            currentDateTextStyle: widget.currentDateTextStyle,
            disabledCellsDecoration: widget.disabledCellsDecoration,
            disabledCellsTextStyle: widget.disabledCellsTextStyle,
            enabledCellsDecoration: widget.enabledCellsDecoration,
            enabledCellsTextStyle: widget.enabledCellsTextStyle,
            selectedCellDecoration: widget.singelSelectedCellDecoration,
            selectedCellTextStyle: widget.singelSelectedCellTextStyle,
            slidersColor: widget.slidersColor,
            slidersSize: widget.slidersSize,
            leadingDateTextStyle: widget.leadingDateTextStyle,
            splashColor: widget.splashColor,
            highlightColor: widget.highlightColor,
            splashRadius: widget.splashRadius,
            onDateSelected: (selectedYear) {
              setState(() {
                _diplayedDate = selectedYear;
                _pickerType = PickerType.months;
              });
            },
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _callendarKey,
      decoration: BoxDecoration(
        color: MyColors.white['c900'],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: MyColors.white['c900'],
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 2),
            child: CustomPaint(
              size: const Size(50, 3),
              painter: _DragStickDraw(),
            ),
          ),
          Padding(
            padding: widget.padding,
            child: _renderPicker(),
          )
        ],
      ),
    );
  }
}

class _DragStickDraw extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = MyColors.grey['c200']!
      ..style = PaintingStyle.fill;

    RRect myRect = RRect.fromRectAndRadius(
        const Offset(0, 0) & size, const Radius.circular(50));

    canvas.drawRRect(myRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
