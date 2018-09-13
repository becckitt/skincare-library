import gql from 'graphql-tag'

export const SIGNUP_MUTATION = gql`{
  
}`

export const LOGIN_MUTATION = gql`{
  mutation ($email: String!) {
    loginUser(email: $email) {
      email
    }
  }
}`