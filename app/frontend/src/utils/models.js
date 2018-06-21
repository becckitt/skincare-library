// import { Model, attr, belongsTo, hasOne, hasMany, Config } from 'jsorm';
import { Model, attr, Config } from 'jsorm'

const ApplicationRecord = Model.extend({
  static: {
    baseUrl: '',
    apiNamespace: '/api/v1'
  },

  createdAt: attr({ persist: false }),
  updatedAt: attr({ persist: false })
})

export const Product = ApplicationRecord.extend({
  static: {
    jsonapiType: 'products'
  },

  name: attr(),
  comment: attr(),
  rating: attr(),
  link: attr(),
  price_cents: attr(),
  repurchase: attr(),
  product_type: attr(),
  wishlist: attr()
})

Config.setup()

// Ensure Cookies are passed in the fetch request in order
// to authenticate the user
Config.beforeFetch.push((url, options) => {
  options.credentials = 'same-origin'
})
