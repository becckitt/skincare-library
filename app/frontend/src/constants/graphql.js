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

export const BRAND_PRODUCTS_QUERY = gql`{
  brandProducts {
    name
    products {
      name
    }
  }
}`
