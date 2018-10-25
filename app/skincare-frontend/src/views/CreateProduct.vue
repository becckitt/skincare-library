<template>
  <div class="main">
    <h1>Add a new product</h1>
    <div class="details-section">
      <div class="detail">
        <!-- Name -->
        <label for="product-name">Name:</label>
        <input model="" id="product-name" placeholder="Product name">
      </div>
      <div class="detail">
        <!-- Brand -->
        <label for="brand-name">Brand:</label>
        <input model="" id="brand-name" placeholder="Brand name">
      </div>
      <div class="detail">
        <!-- Product type -->
        <label for="product-type">Product type:</label>
        <input model="" id="product-type" placeholder="Product type">
      </div>
      <div class="detail">
        <!-- Price cents -->
        <label for="price">Price:</label>
        <input model="" id="price" placeholder="Price">
      </div>
      <div class="detail">
        <!-- ingredients -->
        <label for="ingredients">Ingredients:</label>
        <input model="" id="ingredients" placeholder="Ingredients (separated by comma)">
      </div>
      <div class="detail">
        <!-- tags -->
        <label for="tags">Tags:</label>
        <input model="" id="tags" placeholder="Tags (separated by comma)">
      </div>
      <!-- Wishlist boolean -->

      <!-- DEPENDENT ON WISHLIST -->
      <!-- rating -->
      <!-- repurchase -->
      <!-- comment -->
    </div>
  </div>
</template>

<script>
export default {
  name: 'CreateProduct'
}
</script>

<style lang="scss" scoped>
.main {
  max-width: 900px;
  margin: 0 auto;
  padding: 0 20px;
}

.details-section {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  text-align: left;
}

.detail {
  margin-bottom: 20px;
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
}
</style>
