import '../_http/_stub/_file_decoder_stub.dart'
    if (dart.library.html) '../_http/_html/_file_decoder_html.dart'
    if (dart.library.io) '../_http/_io/_file_decoder_io.dart' as decoder;
import '../request/request.dart';

class MultipartFile {
  MultipartFile(
    dynamic data, {
    required this.filename,
    this.contentType = 'application/octet-stream',
  }) : _bytes = decoder.fileToBytes(data) {
    _length = _bytes.length;
    _stream = BodyBytesStream.fromBytes(_bytes);
  }

  final List<int> _bytes;

  final String contentType;

  /// This stream will emit the file content of File.
  Stream<List<int>>? _stream;

  int? _length;

  Stream<List<int>>? get stream => _stream;

  int? get length => _length;

  final String filename;
}
