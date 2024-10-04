void outer(String name, String id) {
  String inner() {
    List<String> nameParts = name.split(" ");
    String lastNameInitial = nameParts[1][0];
    String firstName = nameParts[0];

    return 'Hello Agent $lastNameInitial.$firstName your id is $id';
  }
  print(inner());
}