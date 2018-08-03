import gql from 'graphql-tag'

export const ALL_PRODUCTS_QUERY = gql`{
  allProducts {
    id
    name
    comment
    link
    product_type
    price_cents
    rating
    repurchase
    brand {
      name
    }
  }
}`

export const BRAND_SEARCH_QUERY = gql`
  query brandSearch($filter: String!) {
    brandSearch(filter: {name_contains: $filter}) {
      name
      products {
        id
        name
        comment
      }
    }
}`

export const PRODUCT_SEARCH_QUERY = gql`
  query allProducts($id: ID!) {
    allProducts(filter: {id_contains: $id}) {
      id
      name
      comment
      link
      product_type
      price_cents
      rating
      repurchase
      brand {
        name
      }
    }
}`
