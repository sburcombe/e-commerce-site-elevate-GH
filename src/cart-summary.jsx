import React from 'react';
import CartSummaryItem from './cart-summary-item';

class CartSummary extends React.Component {

  getCartSummaryItem(props) {

    return (
      this.props.cartItem.length > 0
        ? this.props.cartItem.map(cartItem =>
          <CartSummaryItem key={cartItem.id} item={cartItem} />)
        : <div> No Items In Cart</div>
    );
  }

  render() {
    return (
      <React.Fragment>
        <div className="col-sm-8 table-container">
          <div>
            <button type="button" id="back-to-catalog" onClick={() => this.props.setView('catalog', {})} className="btn btn-outline-secondary mt-3">Back to Catalog</button>
            <h3>My Cart</h3>
            <div>
              {this.getCartSummaryItem()}
            </div>
          </div>
        </div>
        <div className="d-flex justify-content-around">
          <h3 className="p-2"> Item Total:  $ {this.props.cartTotal()}</h3>
          <button type="button" id="checkout" onClick={() => this.props.setView('checkout', {})} className="btn btn-outline-primary m-auto ml-5 p-2">Checkout</button>

        </div>
      </React.Fragment>

    );
  }

}

export default CartSummary;
