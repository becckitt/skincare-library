import gql from 'graphql-tag'

export const ALL_PRODUCTS_QUERY = gql`{
  allProducts {
    id
    name
    comment
    link
    brand {
      name
    }
  }
}`
