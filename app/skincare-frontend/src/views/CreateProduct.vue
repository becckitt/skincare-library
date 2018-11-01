<template>
  <div class="main">
    <h1>Add a new product</h1>
    <form>
      <div class="details-section">
        <div class="detail">
          <!-- Name -->
          <label for="product-name">Name:</label>
          <input v-model="product.name" id="product-name" placeholder="name of product (required)" required>
        </div>
        <div class="detail">
          <!-- Brand -->
          <label for="brand-name">Brand:</label>
          <input v-model="product.brand" id="brand-name" placeholder="name of brand (required)" required>
        </div>
        <div class="detail">
          <!-- Product type -->
          <label for="product-type">Product type:</label>
          <input v-model="product.product_type" id="product-type" placeholder="type of product">
        </div>
        <div class="detail">
          <!-- Product comment -->
          <label for="product-comment">Comments:</label>
          <input v-model="product.comment" id="product-comment" placeholder="comments, notes, etc">
        </div>
        <div class="detail">
          <!-- Product link -->
          <label for="product-link">Product link:</label>
          <input v-model="product.link" id="product-link" placeholder="link to product">
        </div>
        <div class="detail">
          <!-- Price cents -->
          <label for="price">Price:</label>
          <input v-model="product.price_cents" id="price" placeholder="price in 00.00">
        </div>
        <div class="detail">
          <!-- ingredients -->
          <label for="ingredients">Ingredients:</label>
          <input v-model="product.ingredients" id="ingredients" placeholder="ingredients, separated by comma">
        </div>
        <div class="detail">
          <!-- tags -->
          <label for="tags">Tags:</label>
          <input v-model="product.tags" id="tags" placeholder="tags, separated by comma">
        </div>
        <div class="detail long-section">
          <!-- Wishlist boolean -->
          <div class="checkbox-section">
            <input v-model="wishlist" id="wishlist" type="checkbox" class="checkbox">
            <label for="wishlist">Add product to wishlist?</label>
          </div>
        </div>

        <!-- Only show this section for non-wishlist products -->
        <div v-if="!wishlist" class="detail long-section select-section">
          <!-- Repurchase -->
          <div>
            <label for="repurchase">Repurchase?</label>
            <div class="styled-select">
              <select v-model="product.repurchase" id="repurchase">
                <option selected>yes</option>
                <option>no</option>
                <option>maybe</option>
              </select>
            </div>
          </div>

          <div>
            <label for="rating">Rating:</label>
            <div class="styled-select">
              <select v-model="product.rating" id="rating">
                <option selected>0</option>
                <option v-for="i in 10" v-bind:key="i">{{ i }}</option>
              </select>
            </div>
          </div>
        </div>
      </div>
      <button v-on:click="addProduct()" class="product-button">Add product --></button>
    </form>
  </div>
</template>

<script>
import { CreateProduct } from '../graphql/mutations/products.graphql'
import firebase from 'firebase'
import 'firebase/auth'

export default {
  name: 'CreateProduct',
  data () {
    return {
      product: {
        name: '',
        comment: '',
        brand: '',
        type: '',
        price_cents: 0.00,
        link: '',
        rating: 0,
        repurchase: 'yes',
        ingredients: '',
        tags: ''
      },
      wishlist: false,
      firebaseUser: firebase.auth().currentUser.email
    }
  },
  methods: {
    addProduct () {
      this.$apollo.mutate({
        mutation: CreateProduct,
        variables: {
          input: {
            name: this.product.name,
            comment: this.product.comment,
            brand: this.product.brand,
            product_type: this.product.type,
            price_cents: parseFloat(this.product.price_cents),
            link: this.product.link,
            rating: this.product.rating,
            repurchase: this.product.repurchase,
            wishlist: this.wishlist,
            ingredients: this.product.ingredients,
            tags: this.product.tags,
            user: this.firebaseUser
          }
        }
      }).then(data => {
        const productId = data.data.createProduct.id
        this.$router.push({path: `/products/${productId}`})
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.main {
  max-width: 900px;
  margin: 0 auto;
  padding: 0 20px;
}

.details-section {
  text-align: left;
  margin-bottom: 60px;
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-column-gap: 50px;
  grid-row-gap: 40px;
}

.detail.long-section {
  grid-column: 1/2;
}

input {
  border: none;
  border-bottom: 2px black solid;
  height: 30px;
  width: 250px;
}

label {
  font-weight: bold;
  padding-right: 5px;
  display: block;
}

.checkbox-section {
  position: relative;
}

.checkbox {
  position: absolute;
  opacity: 0;
  margin-right: 15px;

  & + label {
    margin-left: 30px;

    &:hover {
      &:before {
        background: #dedede;
      }
    }
  }

  & + label:before {
    content: '';
    position: absolute;
    display: inline-block;
    width: 20px;
    height: 20px;
    background: white;
    border: 2px solid black;
    margin-left: -31px;
    margin-top: -1px;
  }

   &:checked + label:after {
    content: 'x';
    position: absolute;
    font-size: 20px;
    left: 5px;
    top: -4px;
    width: 14px;
    height: 14px;
  }
}

.select-section {
  label {
    margin: 10px 0 5px 0;
  }
}

.styled-select {
  position: relative;
  border: 2px solid black;
  box-sizing: border-box;
  max-width: 125px;

  select {
    border: 0 none;
    background-color: transparent;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    width: 100%;
    min-width: 100px;
    padding: 0 0 6px 5px;
  }

  &:before {
    content: '';
    display: block;
    position: absolute;
    top: 7px;
    right: 6px;
    text-align: center;
    pointer-events: none;
    border-top: 6px solid black;
    border-left: 6px solid transparent;
    border-right: 6px solid transparent;
  }
}
</style>
