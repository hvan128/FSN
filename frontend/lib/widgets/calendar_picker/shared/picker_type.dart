/// Initial display of the picker.
///
enum PickerType {
  /// Choosing a day.
  days,

  /// Choosing a month.
  months,

  /// Choosing a year.
  years,
}

/// Type for parameter submit action
///
/// ### With Date picker:
///
/// * start: Start date
///
/// * end: End date
///
/// * date: null
///
/// ### With Month picker:
///
/// * start: null
///
/// * end: null
///
/// * date: Selected Date
///

class DateSubmit {
  /// Start value
  ///
  /// Available only with Date picker
  final DateTime? start;

  /// End value
  ///
  /// Available only with Date picker
  final DateTime? end;

  /// Selected value
  ///
  /// Available only with Month picker
  final DateTime? date;

  /// Calendar picker type
  final PickerType type;

  DateSubmit({
    DateTime? start,
    DateTime? end,
    DateTime? date,
    required this.type,
  })  : assert(
          (type == PickerType.days && start != null && end != null) ||
              (type == PickerType.months && date != null),
        ),
        date = (type == PickerType.days) ? null : date,
        start = (type == PickerType.months) ? null : start,
        end = (type == PickerType.months) ? null : end;
}
