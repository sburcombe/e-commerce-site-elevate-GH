import React from 'react';

function CartSummaryItem(props) {
  return (
    <div className="container">
      <div className="row">
        <div className="col-lg-8 col-md-6 mt-3">
          <img className="img-fluid" src={props.item.images} alt={props.item.name} ></img>
        </div>
        <div className="col-lg-4 col-md-6 mt-3">
          <h5>{props.item.name}</h5>
          <p>{'$' + (props.item.price / 100).toFixed(2)}</p>
          <p >{props.item.shortDescription}</p>
        </div>
      </div>
    </div>
  );
}

export default CartSummaryItem;
