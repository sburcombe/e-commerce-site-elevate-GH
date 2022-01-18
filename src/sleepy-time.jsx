import React from 'react';
import ProductListItem from './product-list-item';

class ProductList extends React.Component {
  constructor(props) {
    super(props);
    this.getProductItem = this.getProductItem.bind(this);
  }
  getProductItem() {
    return (
      this.props.productsFromApp.length > 0
        ? this.props.productsFromApp.map(product =>
          <ProductListItem setView={this.props.setView} key={product.id} productInfo={product} />)
        : <div> No products received </div>
    );
  }
  render() {
    return (
      <div className='row'>
        {this.getProductItem()}
      </div>
    );
  }
}

export default ProductList;
