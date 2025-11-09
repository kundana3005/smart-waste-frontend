class Complaint {
  final String complaintID;
  final String userID;
  final List<double> location;
  final String beforePhoto;
  final String afterPhoto;
  final String? assignedWorkerID;
  final String status;
  final int? accuracyScore;
  Complaint({
    required this.complaintID,
    required this.userID,
    required this.location,
    required this.beforePhoto,
    required this.afterPhoto,
    this.assignedWorkerID,
    required this.status,
    this.accuracyScore,
  });
}