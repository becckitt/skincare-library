import gql from 'graphql-tag'

export const ALL_PRODUCTS_QUERY = gql`
  query productQuery {
    allProducts {
      id
      name
      comment
      link
      brand {
        name
      }
    }
  }
`
