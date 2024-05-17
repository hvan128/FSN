
import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/button_icon.dart';
import 'package:frontend/widgets/divider.dart';
import 'package:frontend/widgets/icon_button.dart';
import 'package:frontend/widgets/text.dart';
import 'package:intl/intl.dart';

import 'shared/picker_header.dart';
import 'range_days_view.dart';
import 'package:intl/intl.dart' as intl;

/// A scrollable grid of months to allow picking a day range.
class RangeDaysPicker extends StatefulWidget {
  RangeDaysPicker({
    super.key,
    required this.minDate,
    required this.maxDate,
    this.initialDate,
    this.currentDate,
    this.selectedStartDate,
    this.selectedEndDate,
    this.daysOfTheWeekTextStyle,
    this.enabledCellsTextStyle,
    this.enabledCellsDecoration,
    this.disabledCellsTextStyle,
    this.disabledCellsDecoration,
    this.currentDateTextStyle,
    this.currentDateDecoration,
    this.selectedCellsTextStyle,
    this.selectedCellsDecoration,
    this.singelSelectedCellTextStyle,
    this.singelSelectedCellDecoration,
    this.onLeadingDateTap,
    this.onStartDateChanged,
    this.onEndDateChanged,
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
        final init =
            DateTime(initialDate!.year, initialDate!.month, initialDate!.day);

        final min = DateTime(minDate.year, minDate.month, minDate.day);

        return init.isAfter(min) || init.isAtSameMomentAs(min);
      }(),
      'initialDate $initialDate must be on or after minDate $minDate.',
    );
    assert(
      () {
        if (initialDate == null) return true;
        final init =
            DateTime(initialDate!.year, initialDate!.month, initialDate!.day);

        final max = DateTime(maxDate.year, maxDate.month, maxDate.day);
        return init.isBefore(max) || init.isAtSameMomentAs(max);
      }(),
      'initialDate $initialDate must be on or before maxDate $maxDate.',
    );
  }

  /// The date which will be displayed on first opening.
  /// If not specified, the picker will default to `DateTime.now()` date.
  ///
  /// Note that only dates are considered. time fields are ignored.
  final DateTime? initialDate;

  /// The date to which the picker will consider as current date. e.g (today).
  /// If not specified, the picker will default to `DateTime.now()` date.
  ///
  /// Note that only dates are considered. time fields are ignored.
  final DateTime? currentDate;

  /// The currently selected start date.
  ///
  /// This date is highlighted in the picker.
  ///
  /// Note that only dates are considered. time fields are ignored.
  final DateTime? selectedStartDate;

  /// The currently selected end date.
  ///
  /// This date is highlighted in the picker.
  ///
  /// Note that only dates are considered. time fields are ignored.
  final DateTime? selectedEndDate;

  /// Called when the user picks a start date.
  final ValueChanged<DateTime?>? onStartDateChanged;

  /// Called when the user picks an end date.
  final ValueChanged<DateTime?>? onEndDateChanged;

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

  /// Called when the user tap on the leading date.
  final VoidCallback? onLeadingDateTap;

  /// The text style of the days of the week in the header.
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

  final TextStyle? selectedCellsTextStyle;

  final BoxDecoration? selectedCellsDecoration;

  /// The text style of a single selected cell and the
  /// leading/trailing cell of a selected range.
  final TextStyle? singelSelectedCellTextStyle;

  /// The cell decoration of a single selected cell and the
  /// leading/trailing cell of a selected range.
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
  State<RangeDaysPicker> createState() => __RangeDaysPickerState();
}

class __RangeDaysPickerState extends State<RangeDaysPicker> {
  final GlobalKey _pageViewKey = GlobalKey();
  late final ScrollController _controller;
  // Represents the maximum height for a calendar with 6 weeks.
  // In scenarios where a month starts on the last day of a week,
  // it may extend into the first day of the sixth week to
  // accommodate the full month.
  double maxHeight = 310;

  List<Widget> _headerText = <Widget>[];

  late int _numberOfMonths;

  final DateFormat _formaterPeriod = DateFormat('d, MMM yyyy');

  /// Builds widgets showing abbreviated days of week. The first widget in the
  /// returned list corresponds to the first day of week for the current locale.
  ///
  /// Examples:
  ///
  ///     ┌ Sunday is the first day of week in the US (en_US)
  ///     |
  ///     S M T W T F S  ← the returned list contains these widgets
  ///     _ _ _ _ _ 1 2
  ///     3 4 5 6 7 8 9
  ///
  ///     ┌ But it's Monday in the UK (en_GB)
  ///     |
  ///     M T W T F S S  ← the returned list contains these widgets
  ///     _ _ _ _ 1 2 3
  ///     4 5 6 7 8 9 10
  ///
  List<Widget> _dayHeaders(
    TextStyle headerStyle,
    Locale locale,
    MaterialLocalizations localizations,
  ) {
    final List<Widget> result = <Widget>[];
    final weekdayNames =
        intl.DateFormat('', locale.toString()).dateSymbols.NARROWWEEKDAYS;

    for (int i = localizations.firstDayOfWeekIndex; true; i = (i + 1) % 7) {
      // to save space in arabic as arabic don't has short week days.
      final String weekday = weekdayNames[i].replaceFirst('ال', '');
      result.add(
        ExcludeSemantics(
          child: SizedBox(
            width: 40,
            height: 40,
            child: Center(
              child: Text(
                weekday.toUpperCase(),
                style: headerStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );
      if (i == (localizations.firstDayOfWeekIndex - 1) % 7) {
        break;
      }
    }
    return result;
  }

  @override
  void initState() {
    _numberOfMonths = DateUtils.monthDelta(widget.minDate, widget.maxDate) + 1;

    if (widget.selectedStartDate == null && widget.selectedEndDate == null) {
      // to bottom
      _controller = ScrollController(
        initialScrollOffset: (_numberOfMonths - 1) * maxHeight,
      );
    } else {
      // init to selected or initial item
      _controller = ScrollController(
        initialScrollOffset: maxHeight *
            DateUtils.monthDelta(
              widget.minDate,
              widget.selectedStartDate ?? widget.initialDate ?? DateTime.now(),
            ),
      );
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant RangeDaysPicker oldWidget) {
    // there is no need to check for the displayed month because it changes via
    // page view and not the initial date.
    // but for makeing debuging easy, we will navigate to the initial date again
    // if it changes.
    if (oldWidget.initialDate != widget.initialDate) {}
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    //
    //! days of the week
    //
    //
    final TextStyle daysOfTheWeekTextStyle = widget.daysOfTheWeekTextStyle ??
        TextStyle(
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w600,
          color: MyColors.grey['c700']!,
          fontStyle: FontStyle.normal,
          height: 20 / FontSize.z14,
          fontSize: FontSize.z14,
        );

    _headerText = _dayHeaders(
      daysOfTheWeekTextStyle,
      Localizations.localeOf(context),
      MaterialLocalizations.of(context),
    );

    //
    //! enabled
    //
    //

    final TextStyle enabledCellsTextStyle = widget.enabledCellsTextStyle ??
        TextStyle(
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w600,
          color: MyColors.grey['c700']!,
          fontStyle: FontStyle.normal,
          height: 12 / FontSize.z12,
          fontSize: FontSize.z12,
          letterSpacing: 0.12,
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
          height: 18 / FontSize.z12,
          fontSize: FontSize.z12,
          letterSpacing: 0.12,
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

    final TextStyle selectedCellsTextStyle = widget.selectedCellsTextStyle ??
        TextStyle(
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w700,
          color: MyColors.grey['c600']!,
          fontStyle: FontStyle.normal,
          height: 16 / FontSize.z12,
          fontSize: FontSize.z12,
          letterSpacing: 0.12,
        );

    final BoxDecoration selectedCellsDecoration =
        widget.selectedCellsDecoration ??
            BoxDecoration(
              color: MyColors.primary['CulturalYellow']!['c100']!,
            );

    //
    //! singel

    final TextStyle singelSelectedCellTextStyle =
        widget.singelSelectedCellTextStyle ??
            TextStyle(
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w700,
              color: MyColors.white['c900']!,
              fontStyle: FontStyle.normal,
              height: 16 / FontSize.z12,
              fontSize: FontSize.z12,
              letterSpacing: 0.12,
            );

    final BoxDecoration singelSelectedCellDecoration =
        widget.singelSelectedCellDecoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: MyColors.primary['CulturalYellow']!['c700']!,
            );

    //
    //
    //
    //! header
    final leadingDateTextStyle = widget.leadingDateTextStyle ??
        TextStyle(
          fontSize: FontSize.z12,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        );

    //
    //! splash
    final splashColor = widget.splashColor ??
        selectedCellsDecoration.color?.withOpacity(0.3) ??
        colorScheme.primary.withOpacity(0.3);

    final highlightColor =
        widget.highlightColor ?? Theme.of(context).highlightColor;
    //
    //

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        PickerHeader(
          title: widget.title,
          leadingDateTextStyle: leadingDateTextStyle,
          onDateTap: () => widget.onLeadingDateTap?.call(),
          selectedLabel: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                fit: StackFit.loose,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: MyColors.primary['CulturalYellow']!['c100']!,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(100),
                              bottomLeft: Radius.circular(100),
                            ),
                            border: Border(
                              right: BorderSide(
                                width: 1,
                                color: MyColors.primary['CulturalYellow']!['c200']!,
                              ),
                            ),
                          ),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.center,
                            spacing: 4,
                            children: [
                              MyText(
                                text: widget.selectedStartDate != null
                                    ? _formaterPeriod
                                        .format(widget.selectedStartDate!)
                                    : '',
                                fontSize: FontSize.z14,
                                fontWeight: FontWeight.w700,
                                color: MyColors.primary['KiduBlue']!['c700']!,
                                lineHeight: 18 / FontSize.z14,
                              ),
                              if (widget.selectedStartDate != null)
                                MyIconButton2(
                                  padding: 0,
                                  src:
                                      'assets/icons/i16/close-inside-circle.png',
                                  widthIcon: 16,
                                  heightIcon: 16,
                                  onPressed: () {
                                    widget.onStartDateChanged?.call(null);
                                  },
                                )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: MyColors.primary['CulturalYellow']!['c100']!,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(100),
                              bottomRight: Radius.circular(100),
                            ),
                          ),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.center,
                            spacing: 4,
                            children: [
                              MyText(
                                text: widget.selectedEndDate != null
                                    ? _formaterPeriod
                                        .format(widget.selectedEndDate!)
                                    : '',
                                fontSize: FontSize.z14,
                                fontWeight: FontWeight.w700,
                                color: MyColors.primary['KiduBlue']!['c700']!,
                                lineHeight: 18 / FontSize.z14,
                              ),
                              if (widget.selectedEndDate != null)
                                MyIconButton2(
                                  padding: 0,
                                  src:
                                      'assets/icons/i16/close-inside-circle.png',
                                  widthIcon: 16,
                                  heightIcon: 16,
                                  onPressed: () {
                                    widget.onEndDateChanged?.call(null);
                                  },
                                )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Image(
                    image: AssetImage(
                      'assets/icons/i16/arrow-right-circle.png',
                    ),
                    width: 16,
                    height: 16,
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  spacing: 4,
                  children: _headerText,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 12),
        const MyDivider(),
        SizedBox(
          key: ValueKey(maxHeight),
          height: (MediaQuery.of(context).size.height - 50) * 0.5,
          child: ListView.builder(
            semanticChildCount: 3,
            scrollDirection: Axis.vertical,
            prototypeItem: SizedBox(height: maxHeight),
            key: _pageViewKey,
            controller: _controller,
            itemCount: _numberOfMonths,
            itemBuilder: (context, index) {
              final DateTime month =
                  DateUtils.addMonthsToMonthDate(widget.minDate, index);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: MyColors.primary['CulturalYellow']!['c50'],
                    ),
                    child: MyText(
                      text: DateFormat('MMM yyyy').format(month),
                      fontSize: FontSize.z15,
                      fontWeight: FontWeight.w700,
                      color: MyColors.primary['KiduBlue']!['c500']!,
                      lineHeight: 1.2,
                      letterSpacing: -0.15,
                    ),
                  ),
                  const SizedBox(height: 8),
                  RangeDaysView(
                    padding: const EdgeInsets.fromLTRB(12, 0, 4, 12),
                    key: ValueKey<DateTime>(month),
                    currentDate: DateUtils.dateOnly(
                        widget.currentDate ?? DateTime.now()),
                    minDate: DateUtils.dateOnly(widget.minDate),
                    maxDate: DateUtils.dateOnly(widget.maxDate),
                    displayedMonth: month,
                    selectedEndDate: widget.selectedEndDate == null
                        ? null
                        : DateUtils.dateOnly(widget.selectedEndDate!),
                    selectedStartDate: widget.selectedStartDate == null
                        ? null
                        : DateUtils.dateOnly(widget.selectedStartDate!),
                    daysOfTheWeekTextStyle: daysOfTheWeekTextStyle,
                    enabledCellsTextStyle: enabledCellsTextStyle,
                    enabledCellsDecoration: enabledCellsDecoration,
                    disabledCellsTextStyle: disabledCellsTextStyle,
                    disabledCellsDecoration: disbaledCellsDecoration,
                    currentDateDecoration: currentDateDecoration,
                    currentDateTextStyle: currentDateTextStyle,
                    selectedCellsDecoration: selectedCellsDecoration,
                    selectedCellsTextStyle: selectedCellsTextStyle,
                    singelSelectedCellTextStyle: singelSelectedCellTextStyle,
                    singelSelectedCellDecoration: singelSelectedCellDecoration,
                    highlightColor: highlightColor,
                    splashColor: splashColor,
                    splashRadius: widget.splashRadius,
                    onEndDateChanged: (value) =>
                        widget.onEndDateChanged?.call(value),
                    onStartDateChanged: (value) =>
                        widget.onStartDateChanged?.call(value),
                  ),
                ],
              );
            },
          ),
        ),
        const MyDivider(),
        const SizedBox(height: 12),
        MyButton(
          text: 'Next',
          onPressed: widget.onSubmit,
        ),
      ],
    );
  }
}
