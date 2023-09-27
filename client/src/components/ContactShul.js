import { useContext, useState } from "react"
import AppContext from "../AppContext"
function ContactShul() {
  const { user, shuls } = useContext(AppContext)
  const [message, setMessage] = useState('')
  const [errors, setErrors] = useState([])
  // {/* select option listing all shuls */}

  const shulSelectOptions = shuls.map(shul => {
    return <option value={shul.name} key={shul.id}>{shul.name}</option>
  })

  function handleMessageChange(e) {
    setMessage(e.target.value)
  }

  function submitMessage(e) {
    // trigger action mailer
    e.preventDefault()
    console.log('submitMessage clicked')
  }

  return (
    <div className="container">

      {/* message */}
      {/* send button that fires off an email*/}
      <div className="container mt-5">
        <div className="row">
          <div className="col-md-6 offset-md-3">
            <form onSubmit={submitMessage}>
              <div className="mb-3">
                <label for="selectOption" className="form-label">Contact:</label>
                <select className="form-select" id="selectOption">
                  {shulSelectOptions}
                </select>
              </div>
              <div className="mb-3">
                <label for="textarea" className="form-label">Message:</label>
                <textarea className="form-control"
                  id="textarea"
                  rows="4"
                  onChange={handleMessageChange}
                ></textarea>
              </div>
              <button type="submit" className="btn btn-primary">Submit</button>
            </form>
          </div>
        </div>
      </div >
    </div >
  )
}

export default ContactShul