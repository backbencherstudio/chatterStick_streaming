class NotificationModel {
  final String title;
  final String message;
  final String timeAgo;
  final bool isRead;

  NotificationModel({
    required this.title,
    required this.message,
    required this.timeAgo,
    required this.isRead,
  });
}

final List<NotificationModel> notifications = [
  NotificationModel(
    title: 'Order Out for Delivery!',
    message:
        'Your food is on the move! Track your order for real-time updates.Your food is on the move! Track your order for real-time updates.',
    timeAgo: '20 min ago',
    isRead: false,
  ),
  NotificationModel(
    title: 'Payment Successful!',
    message: 'Your payment of \$25.00 for FoodBuzz has been confirmed.',
    timeAgo: '1 hr ago',
    isRead: true,
  ),
  NotificationModel(
    title: 'New Offer Unlocked!',
    message: 'Get 15% off your next order. Use code: BUZZ15.',
    timeAgo: '3 hrs ago',
    isRead: true,
  ),
];
