import React from 'react';
import Header from './header';
import ProductList from './product-list';
import ProductDetails from './product-details';
import CartSummary from './cart-summary';
import CheckoutForm from './checkout-form';
import SecondaryHeader from './secondary-header';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      products: [],
      view: {
        name: 'catalog',
        params: {}
      },
      cart: []
    };
    this.setView = this.setView.bind(this);
    this.addToCart = this.addToCart.bind(this);
    this.placeOrder = this.placeOrder.bind(this);
    this.getCartTotal = this.getCartTotal.bind(this);
  }
  componentDidMount() {
    this.getProducts();
    // this.getCartItems();
  }
  getCartTotal() {
    var itemsArray = this.state.cart;
    var sum = 0;
    for (var itemIndex = 0; itemIndex < itemsArray.length; itemIndex++) {
      var currentItemPrice = itemsArray[itemIndex].price;
      sum += currentItemPrice;
    }
    var total = (sum / 100).toFixed(2);
    return (
      Number.isNaN(total)
        ? 'No Items In Cart'
        : total
    );
  }
  addToCart(product) {
    fetch('./cart.php', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ 'productId': product.id })
    }).catch(error => console.error('error: ', error));
    // this.getCartItems();
  }

  setView(name, params) {
    this.setState({
      view: {
        name: name,
        params: params
      }
    });
  }

  getProducts() {
    fetch('/api/elevate-dummy-products-list.json'
    , {
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }
    })
      .then(response => {
        return (
          response.json()
        );
      })
      .then(products => {
        this.setState({
          products: products
        });
      });
  }

  // getCartItems() {
  //   fetch('/api/cart.php'
  //   ,{
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json'
  //     }
  //   })
  //     .then(response => {
  //       return (
  //         response.json()
  //       );
  //     })
  //     .then(cartItems => {
  //       this.setState({
  //         cart: cartItems
  //       });
  //     });
  // }

  placeOrder(orderDetails) {
    orderDetails['cart'] = this.state.cart;
    fetch('./orders.php', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(orderDetails)
    })
      .then(response => {
        return response.json();
      }
      ).then(cartProduct => {
        this.setState({
          cart: [],
          view: {
            name: 'catalog',
            params: {}
          }
        });
      }
      )
      .catch(error => console.error('error: ', error));
  }

  render() {
    if (this.state.view.name === 'catalog') {
      return (
        <React.Fragment>
          <Header setView= {this.setView} cartItemsAmount ={this.state.cart.length} />
          <SecondaryHeader></SecondaryHeader>
          <div className="container">
            <ProductList setView={this.setView} productsFromApp={this.state.products} />
          </div>
        </React.Fragment>
      );
    } else if (this.state.view.name === 'details') {
      return (
        <React.Fragment>
          <Header setView={this.setView} cartItemsAmount={this.state.cart.length} />
          <SecondaryHeader></SecondaryHeader>
          <div className="container">
            <ProductDetails addToCart={this.addToCart} setView={this.setView} paramsFromApp={this.state.view.params} productsFromApp={this.state.products} />
          </div>
        </React.Fragment>

      );
    } else if (this.state.view.name === 'cart') {
      return (
        <React.Fragment>
          <Header setView={this.setView} cartItemsAmount={this.state.cart.length} />
          <SecondaryHeader></SecondaryHeader>
          <div className="container">
            <CartSummary setView={this.setView} cartItem={this.state.cart} cartTotal={this.getCartTotal} />
          </div>
        </React.Fragment>
      );
    } else if (this.state.view.name === 'checkout') {
      return (
        <React.Fragment>
          <Header setView={this.setView} cartItemsAmount={this.state.cart.length} />
          <SecondaryHeader></SecondaryHeader>
          <div className="container">
            <CheckoutForm setView={this.setView} placeOrder={this.placeOrder} cartItem={this.state.cart} cartTotal={this.getCartTotal} />
          </div>
        </React.Fragment>
      );
    }
  }
}
