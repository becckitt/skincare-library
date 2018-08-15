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
    ingredients {
      name
    }
    tags {
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
      ingredients {
        name
      }
      tags {
        name
      }
    }
}`

export const INGREDIENT_SEARCH_QUERY = gql`
  query ingredientSearch($filter: String!) {
    ingredientSearch(filter: {name_contains: $filter}) {
      name
      products {
        id
        name
        comment
      }
    }
  }
`

export const TAG_SEARCH_QUERY = gql`
  query tagSearch($filter: String!) {
    tagSearch(filter: {name_contains: $filter}) {
      name
      products {
        id
        name
        comment
      }
    }
  }
`

export const ALL_ROUTINES_QUERY = gql`
  query routineSearch {
    routineSearch {
      id
      time_of_day
      products {
        id
        name
        comment
      }
    }
  }
`

export const ROUTINE_SEARCH_QUERY = gql`
  query routineSearch($filter: String!) {
    routineSearch(filter: {id_contains: $filter}) {
      id
      time_of_day
      products {
        id
        name
        comment
      }
    }
  }
`
