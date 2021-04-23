///Tan.nguyen 4/23/21 :
///
/// Usage:
/// Define:
/// var _customerInfo = Pair('Tann', 'Nhattandev@gmail.com');
///
/// Get Data
/// String _customerName = _customerInfo.left; -> 'Tann'
/// String _customerEmail = _customerInfo.right; -> 'Nhattandev@gmail.com'
///
class Pair {
  Pair(this.left, this.right);

  final dynamic left;
  final dynamic right;

  @override
  String toString() => 'Pair[$left, $right]';
}
