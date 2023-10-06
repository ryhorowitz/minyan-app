import React from "react";

function ContactSuccessModal(toggleModal) {

  return (

    <div className="modal-dialog">
      <div class="alert alert-success mt-4" role="alert">
        <h4 class="alert-heading">Message Sent!</h4>
        <p>You will be redirected back to you profile page shortly</p>
      </div>
    </div>

  )
}

export default ContactSuccessModal