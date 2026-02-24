String timeAgo(DateTime dateTime) {
  final now = DateTime.now();
  final diff = now.difference(dateTime);

  if (diff.inSeconds < 60) return '${diff.inSeconds} secound';
  if (diff.inMinutes < 60) return '${diff.inMinutes} minute';
  if (diff.inHours < 24) return '${diff.inHours} Hour';
  if (diff.inDays < 7) return '${diff.inDays} Day';
  if (diff.inDays < 30) return '${(diff.inDays / 7).floor()} weak';
  if (diff.inDays < 365) return '${(diff.inDays / 30).floor()} month';
  return '${(diff.inDays / 365).floor()} year';
}
