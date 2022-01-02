const getProducts = r'''
  query{
    products{
      items{
        name
        assets{
          preview
        }
        featuredAsset{
          preview
          source
        }
      }
    }
  }
''';
