class BookVolumeInfoReadingModes {
  bool text;
  bool image;

  BookVolumeInfoReadingModes({
    required this.text,
    required this.image,
  });
  factory BookVolumeInfoReadingModes.fromMap(Map<String, dynamic> e) {
    return BookVolumeInfoReadingModes(
      image: e['image'],
      text: e['text'],
    );
  }
}
