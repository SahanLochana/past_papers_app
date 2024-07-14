class RecentPdfFile {
  final String fileName;
  final String fileId;
  final String? fileDateTime;
  final String? url;

  RecentPdfFile({
    required this.fileName,
    required this.fileId,
    this.fileDateTime,
    this.url,
  });
}
