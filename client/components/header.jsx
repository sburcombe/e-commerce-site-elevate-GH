import React from 'react';

function Header(props) {
  return (
    <div className="container">
      {/* <div className="d-flex border border-dark justify-content-center align-items-center mt-2 ml-5"
        style= {{ height: 155 + 'px', width: 700 + 'px' }}> */}
      <div className = "row">
        <img className="col" src="./images/elevatelogo.jpg" ></img>
        <div className ="col mt-1">
          <div className = "row">

            <div className="col border">
              <h3 className =" d-inline-block ml-3 text-center">{props.cartItemsAmount + ' items'}</h3>
              <i className="  fa fa-shopping-cart fa-2x " id="shopping-cart" onClick={() => props.setView('cart')}></i>
            </div>
            <div className="col-sm"></div>
          </div>
        </div>
      </div>
    </div>

  );
}

export default Header;
