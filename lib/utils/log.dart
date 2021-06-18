
import 'dart:developer' as developer;

void printWrapped(String text) {
  final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => developer.log(match.group(0)??''));
}