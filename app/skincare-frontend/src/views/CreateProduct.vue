<template>
  <div class="main">
    <h1>Add a new product</h1>
    <form>
      <div class="details-section">
        <div class="detail">
          <!-- Name -->
          <label for="product-name">Name:</label>
          <input v-model="newProduct.name" id="product-name" placeholder="name of product (required)" required>
        </div>
        <div class="detail">
          <!-- Brand -->
          <label for="brand-name">Brand:</label>
          <input v-model="newProduct.brand" id="brand-name" placeholder="name of brand (required)" required>
        </div>
        <div class="detail">
          <!-- Product type -->
          <label for="product-type">Product type:</label>
          <input v-model="newProduct.type" id="product-type" placeholder="type of product">
        </div>
        <div class="detail">
          <!-- Product comment -->
          <label for="product-comment">Comments:</label>
          <input v-model="newProduct.comment" id="product-comment" placeholder="comments, notes, etc">
        </div>
        <div class="detail">
          <!-- Product link -->
          <label for="product-link">Product link:</label>
          <input v-model="newProduct.link" id="product-link" placeholder="link to product">
        </div>
        <div class="detail">
          <!-- Price cents -->
          <label for="price">Price:</label>
          <input v-model="newProduct.price" id="price" placeholder="price in 00.00">
        </div>
        <div class="detail">
          <!-- ingredients -->
          <label for="ingredients">Ingredients:</label>
          <input v-model="newProduct.ingredients" id="ingredients" placeholder="ingredients, separated by comma">
        </div>
        <div class="detail">
          <!-- tags -->
          <label for="tags">Tags:</label>
          <input v-model="newProduct.tags" id="tags" placeholder="tags, separated by comma">
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
              <select v-model="newProduct.repurchase" id="repurchase">
                <option>Yes</option>
                <option>No</option>
                <option>Maybe</option>
              </select>
            </div>
          </div>

          <div>
            <label for="rating">Rating:</label>
            <div class="styled-select">
              <select v-model="newProduct.rating" id="rating">
                <option>0</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option>6</option>
                <option>7</option>
                <option>8</option>
                <option>9</option>
                <option>10</option>
              </select>
            </div>
          </div>
        </div>
      </div>
      <button v-on:click="addProduct()">Add product --></button>
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
      newProduct: {
        name: '',
        comment: '',
        brand: '',
        type: '',
        price: '0.00',
        link: '',
        rating: 0,
        repurchase: 'no',
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
          name: this.newProduct.name,
          comment: this.newProduct.comment,
          brand: this.newProduct.brand,
          product_type: this.newProduct.type,
          price_cents: this.newProduct.price,
          link: this.newProduct.link,
          rating: String(this.newProduct.rating),
          repurchase: String(this.newProduct.repurchase),
          wishlist: String(this.wishlist),
          ingredients: this.newProduct.ingredients,
          tags: this.newProduct.tags,
          user: this.firebaseUser
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

button {
  border: 2px solid black;
  border-radius: 0;
  padding: 15px;
  font-family: 'Roboto Mono', monospace;
  font-weight: bold;
  font-size: 14px;
  background: transparent;

  &:before {
    content: '';
    position: absolute;
    height: 53px;
    width: 160px;
    background: #fdd6e3;
    z-index: -10;
    margin: -12px -22px;
  }

  &:hover {
    &::before {
      background: #f7adc5;
    }
  }
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
