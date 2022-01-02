const getCollections = r'''
  query{
    collections{
      items{
        id
        name
        slug
      }
    }
  }
''';
