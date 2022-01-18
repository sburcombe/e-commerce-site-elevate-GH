import React from 'react';

class ProductListItem extends React.Component {
  constructor(props) {
    super(props);
    this.productClickView = this.productClickView.bind(this);
  }
  productClickView() {
    this.props.setView('details', this.props.productInfo.id);
  }
  render() {
    if (this.props.productInfo.length === 0) {
      return (
        null
      );
    } else {
      return (
        <div className="col m-3">
          <div className="card" onClick={this.productClickView} style={{ width: 18 + 'rem' }}>
            {/* <img className="card-img-top" src={this.props.productInfo.images[0]} alt={this.props.productInfo.name} style={{ objectFit: 'contain', height: 18 + 'rem' }}></img> */}
            <div className="card-body">
              <p>{'$' + (this.props.productInfo.price / 100).toFixed(2)}</p>
              <h5 className="card-title">{this.props.productInfo.name}</h5>
              <p className="card-text">{this.props.productInfo.shortDescription}</p>
            </div>
          </div>
        </div>

      );
    }

  }
}

export default ProductListItem;
