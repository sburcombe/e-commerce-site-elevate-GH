import React from 'react';

function SecondaryHeader(props) {
  return (
    <div className="container">
      {/* <div className="d-flex border border-dark justify-content-center align-items-center mt-2 ml-5"
        style= {{ height: 155 + 'px', width: 700 + 'px' }}> */}
      <div className="row">

        <div className="col mt-1" style={{ backgroundColor: 'black' }}>
          <div className="row">

            <div className="col border">
              <h3 className=" d-inline-block m-3 text-center" style={{ color: 'white' }}>
                <a href="hydration.jsx" style={{ color: 'white' }}>Hydration</a> </h3>
              <h3 className=" d-inline-block m-3 text-center" style={{ color: 'white' }}>
                <a href="pack-poles.jsx" style={{ color: 'white' }}>Pack & Poles</a></h3>
              <h3 className=" d-inline-block m-3 text-center" style={{ color: 'white' }}>
                <a href="sleepy-time.jsx " style={{ color: 'white' }}>Sleepy Time</a></h3>
              <h3 className=" d-inline-block m-3 text-center" style={{ color: 'white' }}>
                <a href="light-sight.jsx" style={{ color: 'white' }}>Light & Sight</a></h3>
            </div>

          </div>
        </div>
      </div>
    </div>

  );
}

export default SecondaryHeader;
