String constructSqlQueryInsert(
    {required String table,
    required Map<String, dynamic> data,
    List<String>? attributes}) {
  String columns = '';
  String valuesResult = '';
  Iterable<String> keys = data.keys;
  Iterable<dynamic> values = data.values;
  // Columns && Values
  for (var i = 0; i < keys.length; i++) {
    if (i == keys.length - 1) {
      columns += '"${keys.elementAt(i)}"';
      valuesResult += '\'${values.elementAt(i)}\'';
    } else {
      columns += '"${keys.elementAt(i)}",';
      valuesResult += '\'${values.elementAt(i)}\',';
    }
  }
  // Attributes
  String attributesResult = '*';
  if (attributes != null && attributes.isNotEmpty) {
    attributesResult = '';
    for (int i = 0; i < attributes.length; i++) {
      if (i == attributes.length - 1) {
        attributesResult += '"${attributes[i]}"';
      } else {
        attributesResult += '"${attributes[i]}",';
      }
    }
  }
  return 'INSERT INTO "$table"'
      '($columns)'
      'VALUES ($valuesResult)'
      'RETURNING $attributesResult;';
}