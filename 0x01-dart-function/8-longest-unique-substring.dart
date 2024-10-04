String longestUniqueSubstring(String str) {
  int start = 0;
  int maxLength = 0;
  String longestSubstr = '';
  Set<String> visited = {};

  for (int end = 0; end < str.length; end++) {
    while (visited.contains(str[end])) {
      visited.remove(str[start]);
      start++;
    }
    visited.add(str[end]);
    if (end - start + 1 > maxLength) {
      maxLength = end - start + 1;
      longestSubstr = str.substring(start, end + 1);
    }
  }
  return longestSubstr;
}