import React from 'react';

class ProductDetails extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      product: null
    };
  }
  componentDidMount() {
    fetch('/api/products.php?id=' + this.props.paramsFromApp)
      .then(response => {
        return response.json();
      })
      .then(product => {
        this.setState({
          product: product
        });
      })
      .catch(error => console.error('error: ', error));

  }
  render() {
    if (this.state.product !== null) {
      return (
        <React.Fragment>
          <div className="container">
            <button type="button" id="back-to-catalog" onClick={() => this.props.setView('catalog', {})} className="btn btn-outline-secondary mt-3">Back to Catalog</button>
            <div className="row">
              <div className="col-lg-8 col-md-6 mt-3">
                <img className="img-fluid" src={this.state.product.images[0]} alt={this.state.product.name} ></img>
              </div>
              <div className="col-lg-4 col-md-6 mt-3">
                <h5>{this.state.product.name}</h5>
                <p>{'$' + (this.state.product.price / 100).toFixed(2)}</p>
                <p >{this.state.product.shortDescription}</p>
                <button type="button" onClick={() => this.props.addToCart(this.state.product)} className="btn btn-success">Add to Cart</button>
              </div>
            </div>
            <div className= "mt-3">
              <p>{this.state.product.longDescription}</p>
            </div></div>
        </React.Fragment>
      );
    } else {
      return (
        null
      );
    }
  }
}

export default ProductDetails;
